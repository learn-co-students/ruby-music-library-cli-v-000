class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    reply = ""
    while reply != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      reply = gets.strip
      
      # set CLI commands
      case reply
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

  # CLI Methods

  def list_songs
    # sort songs by name
    sort(Song.all).each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    # sort artists by name
    sort(Artist.all).each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    # sort genres by name
    sort(Genre.all).each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def sort(list)
    # abstract the #sort method
    list.sort {|a, b| a.name <=> b.name}
  end

  def list_songs_by_artist
    # ask user to input artist name
    puts "Please enter the name of an artist:"
    artist = gets.strip
    # print list of artist songs, alphabetized by title
    artists = Song.all.select! {|song| song.artist.name == artist}
    sort(artists).each_with_index do |song, i|
      puts "#{i + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    # ask user to input genre name
    puts "Please enter the name of a genre:"
    genre = gets.strip
    # print list of genre's songs, alphabetized by title
    genres = Song.all.select! {|song| song.genre.name == genre}
    sort(genres).each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    # ask user to choose a song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    # plays the selected song
    sort(Song.all).each_with_index do |song, i|
      puts "Playing #{song.name} by #{song.artist.name}" if i + 1 == number
    end
  end

end