require 'pry'
class MusicLibraryController
  def initialize(path= "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    user_input = ""

    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_input = gets.strip

      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end


  def list_songs
    counter = 1
    while counter < Song.all.length + 1
      Song.all.sort{ |a, b| a.name <=> b.name }.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_artists
    counter = 1
    while counter < Artist.all.length + 1
      Artist.all.sort{ |a, b| a.name <=> b.name }.each do |artist|
        puts "#{counter}. #{artist.name}"
        counter += 1
      end
    end
  end

  def list_genres
    counter = 1
    while counter < Genre.all.length + 1
      Genre.all.sort{ |a, b| a.name <=> b.name }.each do |genre|
        puts "#{counter}. #{genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      new_array = []
      artist.songs.each do |song|
        new_array << "#{song.name} - #{song.genre.name}"
      end
      new_array = new_array.uniq.sort
      counter = 1
      while counter < new_array.length
        new_array.each do |song|
          puts "#{counter}. #{song.split(" - ")[0]} - #{song.split(" - ")[1]}"
          counter += 1
        end
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      counter = 1
      while counter < genre.songs.length + 1
        genre.songs.sort{ |a, b| a.name <=> b.name }.each do |song|
          puts "#{counter}. #{song.artist.name} - #{song.name}"
          counter += 1
        end
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end
