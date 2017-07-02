require 'pry'

class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path="./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.strip

    #Base on user input, display results
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist_songs
      when "list genre"
        list_genre_songs
      end
      
    end
  end

  def list_songs
    puts Song.all.collect.with_index{|song,i|
    "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    puts Artist.all.collect.with_index{|artist,i|
    "#{i+1}. #{artist.name}"}
  end

  def list_genres
    puts Genre.all.collect.with_index{|genre,i|
    "#{i+1}. #{genre.name}"}
  end

  def play_song
    puts "What song number would you like to play?"
    input_song = gets.strip
    song = Song.all[input_song.to_i-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist_songs
    puts "Songs by which artist?"
    input_artist = gets.strip
    Artist.all.collect{|artist|
      if artist.name == input_artist
        artist.songs.collect{ |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        }
      end
    }
  end

  def list_genre_songs
    puts "Songs of which genre?"
    input_genre = gets.strip
    Genre.all.collect{|genre|
      if genre.name == input_genre
        genre.songs.collect{ |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        }
      end
    }
  end

end
