require 'pry'

class MusicLibraryController
  # attr_reader :artist, :song, :genre

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
      until input == "exit" # loops and asks for user input until exit
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        input = gets.chomp #asks for user imput

        case input # CLI commands
          when "list songs" # triggers song list
            list_songs
          when "list artists"
            list_artists # triggers artists list
          when "list genres"
            list_genres # triggers genre list
          when "list artist"
            list_songs_by_artist # triggers list by artist
          when "list genre"
            list_songs_by_genre # triggers list by genre
          when "play song"
            play_song  #triggers play song 
        end
    end
  end

  def list_songs
    Song.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song,index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |artist,index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |genre,index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist # prints all songs by specific_artist in # list by song name
    puts "Please enter the name of an artist:"
    specific_artist = gets.strip
    if Artist.find_by_name(specific_artist) != nil
      artist = Artist.find_by_name(specific_artist)
      artist.songs.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song,index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre # prints all songs by specific_genre in # list by song name
    puts "Please enter the name of a genre:"
    specific_genre = gets.strip
    if Genre.find_by_name(specific_genre) != nil
      genre = Genre.find_by_name(specific_genre)
      genre.songs.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end


  def play_song # plays matching song from list of output by song list
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort {|a,b| a.name <=> b.name}[input -1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end


end
