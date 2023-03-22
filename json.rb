require 'fileutils'

def create_dir
  Dir.exist?('./storage') ? nil : create_files
end

def create_files
  Dir.mkdir('./storage')
  FileUtils.touch('./storage/book.json')
  FileUtils.touch('./storage/label.json')
  FileUtils.touch('./storage/music_albums.json')
  FileUtils.touch('./storage/genre.json')
  FileUtils.touch('./storage/game.json')
  FileUtils.touch('./storage/author.json')
end
