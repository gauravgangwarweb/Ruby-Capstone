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
  print 'Multiplayer [Y/N]: '
  multiplayer = gets.chomp.split.map(&:capitalize).join(' ')
  print 'Last played at [dd/mm/yyyy]: '
  last_played_at = gets.chomp
  if last_played_at =~ /^\d{2}\/\d{2}\/\d{4}$/
  puts 'Please state when the game was published in this format - [dd/mm/yyyy]:'
  else
    puts "Invalid date format. Please enter date in dd/mm/yyyy format."
  end
  
  publish_date = gets.chomp
  if publish_date =~ /^\d{2}\/\d{2}\/\d{4}$/
  new_game = Game.new(multiplayer, last_played_at, publish_date)
  @game_list << new_game
  create_dir
  save_files
  print 'Game has been added succesfully'
  else
    puts "Invalid date format. Please enter date in dd/mm/yyyy format."
  end
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
