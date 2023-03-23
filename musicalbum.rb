require_relative 'app'
require_relative 'item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived, :publish_date
  attr_reader :id

  def initialize(on_spotify, publish_date)
    super(id = Random.rand(1..100))
    @id = id
    @on_spotify = on_spotify == 'y'
    @publish_date = publish_date
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    super || @on_spotify ? true : false
  end
end

def list_music
  if @music_list.empty?
    puts 'Music list is empty'
  else
    @music_list.each_with_index do |music, index|
      puts
      puts "(#{index})"
      puts "ID: #{music.id}"
      puts "On Spotify: #{music.on_spotify}"
      puts "Publish Date: #{music.publish_date}"
      puts "Archived: #{music.archived}"
    end
  end
end

def create_music
  puts 'Is it on spotify? [Y/N]: '
  on_spotify = gets.chomp.split.map(&:capitalize).join(' ')
  
  publish_date = ''
  loop do
    puts 'Please state when was the music published [dd/mm/yyyy]:'
    publish_date = gets.chomp
    break if publish_date =~ %r{^\d{2}/\d{2}/\d{4}$}
    puts 'Invalid date format. Please enter date in dd/mm/yyyy format.'
  end
  
  new_music = MusicAlbum.new(on_spotify, publish_date)
  @music_list.push(new_music)
  create_dir
  save_files
  print 'Music album added succesfully.'
end

def add_music(on_spotify, publish_date)
  new_music = MusicAlbum.new(on_spotify, publish_date)
  @music_list << new_music
end

