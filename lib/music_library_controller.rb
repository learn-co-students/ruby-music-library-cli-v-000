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
    counter = 1
    Song.all.map do |song|
    array << song.name
    end
    sorted = array.sort do |a, b|
      a <=> b 
    end 
    sorted.map do |name|
     array_two << Song.find_by_name(name)
  end
  while counter <= array_two.length
  array_two.map do |song_list|
   puts "#{counter}. #{song_list.artist.name} - #{song_list.name} - #{song_list.genre.name}"
   counter += 1
  end
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
  array = []
  array_two = []
  counter = 1
  puts "Please enter the name of an artist:"
  retrieve = gets.chomp
   artist = Artist.find_by_name(retrieve)
   if artist != nil
 artist.songs.map do |songs|
    array << songs.name
    array.sort!
  end 
  array.map do |name|
   array_two << Song.find_by_name(name)
  end
  array_two.map do |list|
   puts "#{counter}. #{list.name} - #{list.genre.name}"
  counter += 1
  end
end
end

def list_songs_by_genre
  array = []
  array_two = []
  counter = 1
  puts "Please enter the name of a genre:"
  retrieve = gets.chomp
   genre = Genre.find_by_name(retrieve)
   if genre != nil
 genre.songs.map do |genres|
    array << genres.name
    array.sort!
  end 
  array.map do |name|
   array_two << Song.find_by_name(name)
  end
  array_two.map do |list|
   puts "#{counter}. #{list.artist.name} - #{list.name}"
  counter += 1
  end
end
end


  def play_song
   puts "Which song number would you like to play?"
    retrieve = gets.chomp.to_i
    if retrieve > 0 && retrieve <= Song.all.length
     sorted = Song.all.map do |songs|
       songs.name
      end 
     sorted_artist = Song.all.map do |songs|
       songs.artist.name
     end 
     puts Playing #{sorted.sort[retrieve-1]} by #{sorted_artist.sort[retrieve-2]
     
     
    end
  end


end

