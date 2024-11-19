class MusicLibraryController
  attr_accessor :controller


  def initialize(path = "./db/mp3s")
    @controller = MusicImporter.new(path)

    @controller.import

  end

  def call

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    answer = "" # gets.strip

    until answer == "exit"
      answer = gets.strip
      case answer
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      end
    end
  end

  def list_songs
    songs = []
    self.controller.files.collect do |file|
      songs << file.split(" - ")
    end
    songs.sort_by!{|song| song[1]}

    songs = songs.collect {|song| song.join(" - ")}
    counter = 1

    until counter > songs.length
      puts "#{counter}. #{songs[counter - 1].chomp(".mp3")}"
      counter += 1
    end
  end

  def list_artists

    artists = []
    Artist.all.collect do |artist|
      artists << artist.name
    end

    artists = artists.sort

    counter = 1
    until counter > artists.length
      puts "#{counter}. #{artists[counter - 1]}"
      counter += 1
    end
  end

  def list_genres
    genres = []
    Genre.all.collect do |genre|
      genres << genre.name
    end
    genres = genres.sort
    counter = 1
    until counter > genres.length
      puts "#{counter}. #{genres[counter - 1]}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    selected_artist = gets.strip


    artist_files = []

    selected_artist_obj = Artist.find_by_name(selected_artist)
    if selected_artist_obj != nil
      selected_artist_obj.songs.collect do |song|
        artist_files << song.filename
      end
    end

    artist_files = artist_files.collect {|file| file.chomp(".mp3")}


    artist_files = artist_files.collect do |file|
      file = file.split(" - ")
      file = file.drop(1)
      file = file.join(" - ")
    end

    artist_files = artist_files.sort

    counter = 1
    until counter > artist_files.length
      puts "#{counter}. #{artist_files[counter - 1]}"
      counter += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    selected_genre = gets.strip

    genre_files = []

    selected_genre_obj = Genre.find_by_name(selected_genre)
    if selected_genre_obj != nil
      selected_genre_obj.songs.collect do |song|
        genre_files << song.filename
      end
    end

    genre_files = genre_files.collect {|file| file.chomp(".mp3")}


    genre_files = genre_files.collect do |file|
      file = file.split(" - ")
      file.pop
      file = file.reverse
    end

    genre_files = genre_files.sort

    genre_files = genre_files.collect do |file|
      file = file.reverse
      file = file.join(" - ")
    end

    counter = 1
    until counter > genre_files.length
      puts "#{counter}. #{genre_files[counter - 1]}"
      counter += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    selected_song = gets.strip
    selected_song = selected_song.to_i
    if selected_song.between?(1, self.controller.files.length)

      songs = []
      self.controller.files.collect do |file|
        songs << file.split(" - ")
      end
      songs.sort_by!{|song| song[1]}

      puts "Playing #{songs[selected_song - 1][1]} by #{songs[selected_song - 1][0]}"
    end
  end
end
