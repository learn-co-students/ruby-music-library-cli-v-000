require 'pry'
class MusicLibraryController
  extend Concerns::Findable
  attr_reader :path


  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts"To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    response = gets.strip
    until response == "exit"
      case response
        when  "list songs"
          list_songs
          response = "exit"
        when "list artists"
          list_artists
          response = "exit"
        when "list genres"
          list_genres
          response = "exit"
        when "list artist"
          list_songs_by_artist
          response = "exit"
        when "list genre"
          list_songs_by_genre
          response = "exit"
        when "play song"
          play_song
          response = "exit"
        else
          puts "I didn't understand your response."
          response = gets.strip
      end
    end

  end

  def list_songs
    sorted_songs = Song.all.sort do |a,b|
      if a.name == b.name
        0
      elsif a.name < b.name
        -1
      elsif a.name > b.name
        1
      end
    end
    sorted_songs.each_with_index {|song,id|
      puts "#{id+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end

  def list_artists
    sorted_artists = Artist.all.sort do |a,b|
      if a.name == b.name
        0
      elsif a.name < b.name
        -1
      elsif a.name > b.name
        1
      end
    end
    sorted_artists.each_with_index {|artist,id|
      puts "#{id+1}. #{artist.name}"
    }
  end

  def list_genres
    sorted_genre = Genre.all.sort do |a,b|
      if a.name == b.name
        0
      elsif a.name < b.name
        -1
      elsif a.name > b.name
        1
      end
    end
    sorted_genre.each_with_index {|genre,id|
      puts "#{id+1}. #{genre.name}"
    }
  end

  def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input_artist = gets.strip

      if Artist.find_by_name(input_artist) != nil
        artist = Artist.find_by_name(input_artist)
        sorted_list = artist.songs.sort do |a,b|
          if a.name == b.name
            0
          elsif a.name < b.name
            -1
          elsif a.name > b.name
            1
          end
        end
        sorted_list.each_with_index {|song,id|
          puts "#{id+1}. #{song.name} - #{song.genre.name}"
        }
      end
  end

 def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input_genre = gets.strip

      if Genre.find_by_name(input_genre) != nil
        genre = Genre.find_by_name(input_genre)
        sorted_list = genre.songs.sort do |a,b|
          if a.name == b.name
            0
          elsif a.name < b.name
            -1
          elsif a.name > b.name
            1
          end
        end
        sorted_list.each_with_index {|song,id|
          puts "#{id+1}. #{song.artist.name} - #{song.name}"
        }
      end
  end

  def play_song

    puts 'Which song number would you like to play?'


    choice = gets.strip

    sorted_songs = Song.all.sort do |a,b|
      if a.name == b.name
        0
      elsif a.name < b.name
        -1
      elsif a.name > b.name
        1
      end
    end

      sorted_songs.each_with_index {|song,id|
        if id + 1 == choice.to_i
          puts "Playing #{song.name} by #{song.artist.name}"
        else
        end
      }
  end


end