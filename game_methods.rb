require_relative 'app'
require_relative 'game'

def show_games
  if @game_list.empty?
    puts 'This list is empty at the moment'
  else
    @game_list.each_with_index do |game, index|
      puts "(#{index}) ID: #{game.id} Multiplayer: \"#{game.multiplayer}\",
       Last Played: #{game.last_played_at},
        Published Year: #{game.publish_date} Archived: #{game.archived}"
    end
  end
end

def create_game
  multiplayer = getmultiplayer
  last_played_at = getlast_played_at
  publish_date = getpublish_date

  new_game = Game.new(multiplayer, last_played_at, publish_date)
  @game_list << new_game
  create_dir
  save_files
  puts 'Game has been added successfully'
end

def getmultiplayer
  print 'Multiplayer [Y/N]: '
  gets.chomp.capitalize
end

def getlast_played_at
  print 'Last played at [dd/mm/yyyy]: '
  last_played_at = gets.chomp

  until last_played_at.match?(%r{^\d{2}/\d{2}/\d{4}$}) # Validate last_played_at format
    puts 'Invalid date format. Please enter date in dd/mm/yyyy format.'
    print 'Last played at [dd/mm/yyyy]: '
    last_played_at = gets.chomp
  end

  last_played_at
end

def getpublish_date
  print 'Please state when the game was published in this format - [dd/mm/yyyy]: '
  publish_date = gets.chomp

  until publish_date.match?(%r{^\d{2}/\d{2}/\d{4}$}) # Validate publish_date format
    puts 'Invalid date format. Please enter date in dd/mm/yyyy format.'
    print 'Please state when the game was published in this format - [dd/mm/yyyy]: '
    publish_date = gets.chomp
  end

  publish_date
end

def add_game(multiplayer, last_played_at, publish_date)
  new_game = Game.new(multiplayer, last_played_at, publish_date)
  @game_list << new_game
end

def list_genres
  if @genre_list.empty?
    puts 'Genre list is empty'
  else
    @genre_list.each_with_index do |genre, index|
      puts "(#{index}) Genre Name: \"#{genre.name}\""
    end
  end
end
