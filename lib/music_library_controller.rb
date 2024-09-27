require 'pry'

class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    music = MusicImporter.new(path)
    music.import

  end

  def call
    input = ""
    until input == "exit"
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
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      end
    end
  end


  def list_songs
    Song.all.sort! { |a, b|  a.name <=> b.name }


    Song.all.each_with_index do |song, index|
      puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end

  def list_artists
    Artist.all.sort! { |a, b|  a.name <=> b.name }
    Artist.all.each_with_index do |artist, index|
      puts "#{index.to_i + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort! { |a, b|  a.name <=> b.name }
    Genre.all.each_with_index do |genre, index|
      puts "#{index.to_i + 1}. #{genre.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    Song.all.sort! { |a, b|  a.name <=> b.name }
    input = gets.to_i
    index = 0
    if input > 0 || Song.all.count >= input
      Song.all.each do |song|
        if index == input - 1
          puts "Playing #{song.name} by #{song.artist.name}" unless song.nil?
          #binding.pry
        end
        index = index + 1
      end
    end
    #binding.pry



 end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    artist_name = gets.strip

    if artist = Artist.find_by_name(artist_name)
      artist.songs.sort! { |a, b|  a.name <=> b.name }
      artist.songs.each_with_index do |song, index|
        puts "#{index.to_i + 1}. #{song.name} - #{song.genre.name}"
#binding.pry
      end



    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)

      #binding.pry
      genre.songs.each_with_index do |song, index|
        puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name}"
      end

    end


  end

end
