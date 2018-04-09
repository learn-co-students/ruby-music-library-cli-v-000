require "pry"
class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path ='./db/mp3s')
  new_importer = MusicImporter.new(path)
  new_importer.import
  end

def call
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
 puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
    puts "What would you like to do?"
   until gets.chomp == "exit"
   puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
 puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
    puts "What would you like to do?"
end
end

def list_songs
    array = []
    array_two = []
    Song.all.map do |song|
    array << song.name
    end
    sorted = array.sort do |a, b|
      a <=> b 
    end 
    sorted.map do |name|
     array_two << Song.find_by_name(name)
  end
  counter = 1
  array_two.map do |song_list|
   puts "#{counter}. #{song_list.artist.name} - #{song_list.name} - #{song_list.genre.name}"
   counter += 1
  end
end
 
def list_artists
 array = []
    array_two = []
    Artist.all.map do |artist|
    array << artist.name
    end
    sorted = array.sort do |a, b|
      a <=> b 
    end 
    sorted.map do |name|
     array_two << Artist.find_by_name(name)
  end
  counter = 1
  array_two.map do |artist_list|
   puts "#{counter}. #{artist_list.name}"
   counter += 1
  end
end
  
  def list_genres
     array = []
    array_two = []
    Genre.all.map do |genre|
    array << genre.name
    end
    sorted = array.sort do |a, b|
      a <=> b 
    end 
    sorted.map do |name|
     array_two << Genre.find_by_name(name)
  end
  counter = 1
  array_two.map do |genre_list|
   puts "#{counter}. #{genre_list.name}"
   counter += 1
  end
end

def list_songs_by_artist
puts "Please enter the name of an artist:"
retrieve = gets.chomp


end

end