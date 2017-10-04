class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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
      end
    end
  end

  def list_songs
    Song.all.sort! { |a, b|  a.name <=> b.name }
    i = 1
    Song.all.each do |instance|
      puts "#{i}. #{instance.artist.name} - #{instance.name} - #{instance.genre.name}"
      i += 1
    end
  end

  def list_artists
    Artist.all.sort! { |a, b|  a.name <=> b.name }
    i = 1
    Artist.all.each do |instance|
      puts "#{i}. #{instance.name}"
      i += 1
    end
  end

  def list_genres
    Genre.all.sort! { |a, b|  a.name <=> b.name }
    i = 1
    Genre.all.each do |instance|
      puts "#{i}. #{instance.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.strip

    Song.all.sort! { |a, b|  a.name <=> b.name }
    i = 1
    Song.all.each do |instance|
      if instance.artist.name == input_artist
        puts "#{i}. #{instance.name} - #{instance.genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input_genre = gets.strip

    Song.all.sort! { |a, b|  a.name <=> b.name }
    i = 1
    Song.all.each do |instance|
      if instance.genre.name == input_genre
        puts "#{i}. #{instance.artist.name} - #{instance.name}"
        i += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input_play = gets.strip.to_i
    Song.all.sort! { |a, b|  a.name <=> b.name }
    i = 1
    Song.all.each do |instance|
      if i == input_play
        puts "Playing #{instance.name} by #{instance.artist.name}"
      end
      i += 1
    end
  end

end
