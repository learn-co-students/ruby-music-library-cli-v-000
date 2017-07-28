class MusicLibraryController

  attr_accessor :path


  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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

      user_input = gets.chomp

      # if user_input == "list songs"
      #   list_songs
      # elsif user_input == "list artists"
      #   list_artists
      # elsif user_input == "list genres"
      #   list_genres
      # elsif user_input == "list artist"
      #   list_artist
      # elsif user_input == "list genre"
      #   list_genre
      # else user_input == "play song"
      #   play_song
      # end
    end
  end

  def list_songs
    Song.all.sort {|a,b| a.name <=> b.name}.each_with_index do |song, number|
      puts "#{number+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort {|a, b| a.name <=> b.name}.each_with_index do |artist, number|
      puts "#{number+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort {|a, b| a.name <=> b.name}.each_with_index do |genre, number|
      puts "#{number+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    user_input = ""
    while user_input != Artist.find_by_name(user_input)
    user_input = gets.chomp
      puts "Please enter the name of an artist:"
    end
    artist_search = Artist.all.detect(user_input){|artist_name| artist_name.songs}
    artist_search.songs.sort {|a, b| a.name <=> b.name}.each_with_index do |songs, number|
      puts "#{number+1}. #{songs.name}"
      end
    end




end
