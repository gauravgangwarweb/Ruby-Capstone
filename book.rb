require_relative 'item'
require_relative 'app'
require_relative 'json'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id

  def initialize(publisher, cover_state)
    super(id = Random.rand(1..100))
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    @archived = if super or @cover_state == 'bad'
                  true
                else
                  false
                end
  end
end

def book_list
  if @book_list.empty?
    puts 'Books list is empty'
  else
    @book_list.each_with_index do |book, index|
      puts "(#{index}) ID: #{book.id}",
           "Publisher: #{book.publisher}",
           "Cover State: #{book.cover_state}"
    end
  end
end

def create_book
  print 'What is the state of the Book Cover? [good/bad]: '
  cover_state = gets.chomp.downcase
  print 'Insert Book Publisher: '
  publisher = gets.chomp
  new_book = Book.new(publisher, cover_state)
  @book_list.push(new_book)
  create_dir
  save_files
  puts "\n The book has been created successfully."
end

def add_book(publisher, cover_state)
  new_book = Book.new(publisher, cover_state)
  @book_list << new_book
end

def read_book(file)
  puts
  puts '=====================      BOOKS     ====================='
  puts
  file.each do |elem|
    book_id = elem['value']['id']
    book_publisher = elem['value']['publisher']
    book_cover = elem['value']['cover_state']
    puts "ID: #{book_id}"
    puts "Publisher: #{book_publisher}"
    puts "Cover State: #{book_cover}"
    add_book(book_publisher, book_cover)
  end
end

def read_label(file)
  puts
  puts '=====================     LABELS     ====================='
  puts
  file.each do |el|
    label_title = el['value']['title']
    puts "Label: #{label_title}"
  end
end
