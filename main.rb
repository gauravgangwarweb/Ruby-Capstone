require_relative 'app'
require_relative 'menu'
require_relative 'game_data'
require_relative 'book_data'

def main
  app = App.new
  app.read_files if Dir.exist?('./storage')
  app.read_files2 if Dir.exist?('./storage')

  loop do
    menu(app)
  end
end

main
