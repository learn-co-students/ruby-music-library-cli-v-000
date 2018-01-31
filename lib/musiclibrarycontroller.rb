class MusicLibraryController

  def initialize(path='./db/mp3s')
  newimport = MusicImporter.new(path)
  newimport.import
  end

   def call
    input = ''
    until input.casecmp('exit').zero?
   puts 'Welcome to your music library!'
   puts "To list all of your songs, enter 'list songs'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts 'What would you like to do?'
   input = gets.chomp
   case input.downcase
   when 'list songs'
   list_songs
   when 'list artists'
   list_artists
   when 'list genres'
   list_genres
   when 'list artist'
   list_songs_by_artist
   when 'list genre'
   list_songs_by_genre
   when 'play song'
  play_song
  end
  end
  end

 def list_songs
 Song.all.sort_by!(&:name)
 Song.all.each_with_index do |song, index|
 puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
 end
 end

 def list_artists
  Artist.all.sort_by!(&:name)
  Artist.all.each_with_index do |artist, index|
  puts "#{index+1}. #{artist.name}"
  end
  end

def list_genres
Genre.all.sort_by!(&:name)
Genre.all.each_with_index do |genre, index|
puts "#{index+1}. #{genre.name}"
end
end

def list_songs_by_artist
counter = 1

puts "Please enter the name of an artist:"
artist = gets.chomp

Song.all.sort_by!(&:name)
Song.all.each do |song|
if song.artist.name == artist
puts "#{counter}. #{song.name} - #{song.genre.name}"
counter += 1
end
end
end

def list_songs_by_genre
counter = 1

puts "Please enter the name of a genre:"
genre = gets.chomp

Song.all.sort_by!(&:name)
Song.all.each do |song|
if song.genre.name == genre
puts "#{counter}. #{song.artist.name} - #{song.name}"
counter += 1
end
end
end

def play_song
puts 'Which song number would you like to play?'
Song.all.sort_by!(&:name)
input = gets.chomp
song_number = input.to_i - 1
if Song.all[song_number] && input.to_i > 0
puts "Playing #{Song.all[song_number].name} by #{Song.all[song_number].artist.name}"
end
end

end
