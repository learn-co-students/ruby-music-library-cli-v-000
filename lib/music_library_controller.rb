class MusicLibraryController
attr_accessor :path

def initialize(path = "./db/mp3s")
@path = path
pat = MusicImporter.new(path)
pat.import
end

def call
input = ""
while input != "exit"
puts "Welcome to your music library! Please select from the following commands:
list songs
list artists
list genres
play song
list artist
list genre
exit"
input = gets.strip
  case input
  when  "list songs"
    list_songs
  when "list artists"
    list_artists
  when "list genres"
    list_genres
  when "play song"
    play_song
  when  "list artist"
    list_artists_songs
  when "list genre"
    list_genres_songs
end
end
end

def list_songs
Song.all.each.with_index(1) do |song, i|
puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
end
end

def list_artists
  Artist.all.each.with_index(1) do |artist, i|
    puts "#{i}. #{artist.name}"
end
end

def list_genres
   Genre.all.each.with_index(1) do |genre, i|
     puts "#{i}. #{genre.name}"
   end
end

def play_song
   list_songs
   puts "Please select a song from the list: "
   song_i = gets.strip
  puts "Playing #{Song.all[song_i.to_i-1].artist.name} - #{Song.all[song_i.to_i-1].name} - #{Song.all[song_i.to_i-1].genre.name}"
end

def list_artists_songs
  puts "Which artist's songs would you like to see?"
  artist_i = gets.strip

  artist = Artist.find_by_name(artist_i)
  artist.songs.each do |song|
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
end
end

def list_genres_songs
  puts "Which genre's songs would you like to see?"
  genre_i = gets.strip
  genre = Genre.find_by_name(genre_i)
  genre.songs.each do |song|
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end


end
