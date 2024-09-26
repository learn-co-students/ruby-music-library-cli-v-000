class MusicLibraryController

  attr_accessor :sorted_songs, :call

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = nil
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
      input = gets
      if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "list artist"
        self.list_songs_by_artist
      elsif input == "list genre"
        self.list_songs_by_genre
      elsif input == "play song"
        self.play_song
      end
    end
  end

  def sorted_songs
    @sorted_songs = Song.all.sort { |a,b| a.name <=> b.name }
  end

  def list_songs
    self.sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort { |a,b| a.name <=> b.name }
    sorted_artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort { |a,b| a.name <=> b.name }
    sorted_genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    if Artist.find_by_name(artist) != nil
      artist_instance = Artist.find_by_name(artist)
      sorted_songs = artist_instance.songs.sort { |a,b| a.name <=> b.name }
      sorted_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    if Genre.find_by_name(genre) != nil
      genre_instance = Genre.find_by_name(genre)
      sorted_songs = genre_instance.songs.sort { |a,b| a.name <=> b.name }
      sorted_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.to_i
    if number >= 1 && number <= Song.all.size
      selected_song = self.sorted_songs[number-1]
      puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end
end
