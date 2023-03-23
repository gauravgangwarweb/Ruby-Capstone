require_relative 'musicalbum'
require_relative 'game_methods'
require_relative 'book_methods'
require_relative 'label'
require_relative 'musicalbum_data'
require 'json'

class App
  attr_accessor :album_list, :genre_list, :game_list, :author_list

  def initialize()
    @music_list = []
    @genre_list = []
    @game_list = []
    @author_list = []
    @book_list = []
    @label_list = []
  end

  def music_display
    list_music
  end

  def genre_display
    list_genres
  end

  def music_create
    create_music
  end

  def game_display
    show_games
  end

  def game_create
    create_game
  end

  def author_display
    list_authors
  end

  def book_display
    book_list
  end

  def label_display
    if @label_list.empty?
      puts 'There are no labels in the catalog'
    else
      @label_list.each do |label|
        puts label.title
      end
    end
  end

  def book_create
    create_book
  end

  def add_label(thing)
    print "Title of the #{thing}: "
    title = gets.chomp.split.map(&:capitalize).join(' ')
    print "Color of the #{thing}: "
    color = gets.chomp.split.map(&:capitalize).join(' ')
    Label.new(title, color)
  end

  def save_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      ary = []
      instance_variable_get(var).each do |obj|
        hash = { ref: obj, value: to_hash(obj) }
        ary << hash
      end
      File.write("./storage/#{file_name}.json", JSON.generate(ary))
    end
  end

  def read_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      if File.exist?("./storage/#{file_name}.json") && !File.empty?("./storage/#{file_name}.json")
        ary = JSON.parse(File.read("./storage/#{file_name}.json"))
        case file_name
        when 'music'
          read_music(ary)
        when 'game'
          read_game(ary)
        when 'label'
          read_label(ary)
        end
      else
        File.write("./storage/#{file_name}.json", '[]')
      end
    end
  end

  def read_files2
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      if File.exist?("./storage/#{file_name}.json") && !File.empty?("./storage/#{file_name}.json")
        ary = JSON.parse(File.read("./storage/#{file_name}.json"))
        case file_name
        when 'genre'
          read_genre(ary)
        when 'author'
          read_author(ary)
        when 'book'
          read_book(ary)
        end
      else
        File.write("./storage/#{file_name}.json", '[]')
      end
    end
  end

  private

  def to_hash(obj)
    hash = {}
    obj.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = obj.instance_variable_get(var)
    end
    hash
  end
end
