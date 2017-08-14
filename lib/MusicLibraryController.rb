require 'pry'

class MusicLibraryController


def initialize(path ="./db/mp3s" )
  mp3 = MusicImporter.new(path)
  mp3.import
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
  input = ""
  while input != "exit"
    input = gets.strip
       if input == "list songs"
          list_songs
       elsif input == "list artists"
          list_artists
       elsif input == "list genres"
          list_genres
       elsif input == "list artist"
          list_songs_by_artist
       elsif input == "list genre"
          list_songs_by_genre
        elsif input == "play song"
             play_song
       else
         "What would you like to do?"
        end
    end
  end


def list_songs
    Song.all.sort_by{|s|  s.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
end

def list_artists
  Artist.all.sort_by{|s| s.name}.each.with_index(1) do |artist, i|
    puts "#{i}. #{artist.name}"
  end
end

def list_genres
  Genre.all.sort_by{|s| s.name}.each.with_index(1) do |genre, i|
    puts "#{i}. #{genre.name}"
  end
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  artist_name =  gets.strip
  artist = Artist.find_by_name(artist_name)
  if artist
  artist.songs.sort_by{|s| s.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.name} - #{song.genre.name}"
     end
   end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  genre_name = gets.strip
  genre = Genre.find_by_name(genre_name)
  if genre
    genre.songs.sort_by{|s| s.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name}"
      end
   end
end

def play_song
  puts "Which song number would you like to play?"
  song_number = gets.strip.to_i
  if song_number.between?(1,Song.all.length)
    song_selected = Song.all.sort_by{|s| s.name}[song_number -1]
    puts "Playing #{song_selected.name} by #{song_selected.artist.name}"
  end
end

end
