require 'pry'

class MusicLibraryController

  attr_accessor :path, :music 

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    while input != 'exit'
       input = gets.strip
       case input
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

  #   CLI Methods
    def list_songs
      counter = 1
      #binding.pry
        sorted_songs = Song.all.sort_by do |song|
          song.name
        end
        sorted_songs.each do |song|
            puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            counter += 1
          end
    end

    def list_artists
      counter = 1
        sorted_artists = Artist.all.sort_by do |artist|
          artist.name
        end
        sorted_artists.each do |artist|
            puts "#{counter}. #{artist.name}"
            counter += 1
        end
    end

    def list_genres
      counter = 1
        sorted_genres = Genre.all.sort_by do |genre|
          genre.name
        end
        sorted_genres.each do |genre|
            puts "#{counter}. #{genre.name}"
            counter += 1
        end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
        input = gets.strip
        if artist = Artist.find_by_name(input)
          artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, number|
          puts "#{number}. #{song.name} - #{song.genre.name}"
        end 
      end 
    end 
  
    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip
      if genre = Genre.find_by_name(input)
          genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, number|
          puts "#{number}. #{song.artist.name} - #{song.name}"
        end 
      end 
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip.to_i 
        if input < Song.all.length && input > 0  
          song = Song.all.sort_by(&:name)[input - 1]
            puts "Playing #{song.name} by #{song.artist.name}"
        end 
    end
    

end
