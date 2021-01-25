class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
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
    Song.all.each.with_index(1) do |instance, i|
      puts "#{i}. #{instance.artist.name} - #{instance.name} - #{instance.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort! { |a, b|  a.name <=> b.name }
    Artist.all.each.with_index(1) do |instance, i|
      puts "#{i}. #{instance.name}"
    end
  end

  def list_genres
    Genre.all.sort! { |a, b|  a.name <=> b.name }
    Genre.all.each.with_index(1) do |instance, i|
      puts "#{i}. #{instance.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.strip

    if artist = Artist.find_by_name(input_artist)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input_genre = gets.strip

    if genre = Genre.find_by_name(input_genre)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input_play = gets.strip.to_i
    if (1..Song.all.length).include?(input_play)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input_play - 1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
