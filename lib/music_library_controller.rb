require 'pry'

class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call
    input = ''
      while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
    
      input = gets.strip
      
      if input == 'list songs'
        self.list_songs
      elsif input == 'list artists'
        self.list_artists
      elsif input == 'list genres'
        self.list_genres
      elsif input == 'list artist'
        self.list_songs_by_artist
      elsif input == 'list genre'
        self.list_songs_by_genre
      elsif input == 'play song'
        self.play_song
      end
    end
  end
  
  
  def list_songs
    Song.all.sort_by{|s| s.name}.each_with_index{|a, i|
      puts "#{i+1}. #{a.artist.name} - #{a.name} - #{a.genre.name}"
    }
  end
  
  def list_artists
    Artist.all.sort_by{|a| a.name}.each_with_index{|a, i|
      puts "#{i+1}. #{a.name}"}
  end
  
  def list_genres
    Genre.all.sort_by{|g| g.name}.each_with_index{|a, i|
      puts "#{i+1}. #{a.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name_input = gets.strip
    artist = Artist.find_by_name(artist_name_input)
    if artist != nil
      artist.songs.sort_by{|song| song.name}.each_with_index{|a, i|
       puts "#{i+1}. #{a.name} - #{a.genre.name}"
     }
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
    if genre != nil
      genre.songs.sort_by{|song| song.name}.each_with_index{|a, i|
        puts "#{i+1}. #{a.artist.name} - #{a.name}"
      }
    end
  end
  
  # def play_song
  #   puts "Which song number would you like to play?"
  #   song_selection = gets.strip.to_i-1
  #   song = Song.all[song_selection]
  #   puts "Playing #{song.name} by #{song.artist.name}" if song
  # end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i

    if input >= 1 && input <= Song.all.length
      song = Song.all.sort {|a,b| a.name <=> b.name}[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end

  end
  
end
