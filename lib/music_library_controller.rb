class MusicLibraryController
  attr_accessor :path, :musicimporter

  def initialize(path="./db/mp3s")
    self.path = path
    self.musicimporter = MusicImporter.new(self.path)
    self.musicimporter.import
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
    songs = Song.all

    songs.sort! do |a,b|
      if a.name == b.name
        0
      elsif a.name < b.name
        -1
      elsif a.name > b.name
        1
      end
    end

    songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end

  def list_artists
    artists = Artist.all

    artists.sort! do |a,b|
      if a.name == b.name
        0
      elsif a.name < b.name
        -1
      elsif a.name > b.name
        1
      end
    end

    artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all

    genres.sort! do |a,b|
      if a.name == b.name
        0
      elsif a.name < b.name
        -1
      elsif a.name > b.name
        1
      end
    end

    genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist
      song_list = self.sort_by_name(artist.songs)
      song_list.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre
      song_list = self.sort_by_name(genre.songs)
      song_list.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input <= Song.all.size
      songs_array = Song.all
      sort_by_name(songs_array)
      song = songs_array[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
   end

  end

  #The following method sorts an object array by the name attribute.
  def sort_by_name(array)
    array.sort! do |a,b|
      if a.name == b.name
        0
      elsif a.name < b.name
        -1
      elsif a.name > b.name
        1
      end
    end
  end

end
