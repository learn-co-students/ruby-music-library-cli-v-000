class MusicLibraryController
  attr_accessor :path, :importer

  def initialize(path="./db/mp3s")
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import
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
    input = gets.chomp
    commands = ["list songs", "list artists", "list genres", "list artist", "list genre", "play song", "exit"]
    if !commands.include?(input)
      self.call
    elsif input == "list songs"
      self.list_songs
    elsif input == "list artists"
      self.list_artists
    elsif input == "list artist"
      self.list_songs_by_artist
    elsif input == "list genre"
      self.list_songs_by_genre
    elsif input == "list genres"
      self.list_genres
    elsif input == "play song"
      self.play_song
    elsif input == "exit"
      nil
    end
  end

  def list_songs
    songs = @importer.import
    songs = songs.sort {|x, y| x.name <=> y.name }
    songs.each_with_index do | song, index |
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all
    artists = artists.uniq { |artist| artist.name }
    artists = artists.sort {|x, y| x.name <=> y.name }
    artists.each_with_index do | artist, index |
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all
    genres = genres.uniq { |genre| genre.name }
    genres = genres.sort {|x, y| x.name <=> y.name }
    genres.each_with_index do | genre, index |
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input =  gets.chomp
    artist = Artist.find_by_name(input)
    if artist
      songs = artist.songs
      songs = songs.sort {|x, y| x.name <=> y.name }
      songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input =  gets.chomp
    genre = Genre.find_by_name(input)
    if genre
      songs = genre.songs
      songs = songs.sort {|x, y| x.name <=> y.name }
      songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
#    self.list_songs

    songs = @importer.import
    songs = songs.sort {|x, y| x.name <=> y.name }
    puts "Which song number would you like to play?"
    input = gets.chomp
    input = input.to_i - 1
    song_chosen = songs[input]
    if song_chosen && input >= 1 && input < songs.size
      puts "Playing #{song_chosen.name} by #{song_chosen.artist.name}"
    end
  end





end
