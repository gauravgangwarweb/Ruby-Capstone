def read_music(file)
  puts
  puts '=====================  MUSIC ALBUMS  ====================='
  puts
  file.each do |el|
    music_id = el['value']['id']
    music_archived = el['value']['archived']
    music_on_spotify = el['value']['on_spotify']
    music_publish_date = el['value']['publish_date']
    puts "ID: #{music_id}"
    puts "On Spotify: #{music_on_spotify}"
    puts "Published on: #{music_publish_date}"
    puts "Archived: #{music_archived}"
    add_music(music_on_spotify, music_publish_date)
  end
end

def read_genre(file)
  puts
  puts '=====================     GENRES     ====================='
  puts
  file.each do |el|
    genre_name = el['value']['name']
    puts "Genre Name: #{genre_name}"
  end
end
