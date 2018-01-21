class MusicLibraryController

  attr_accessor :path, :library

  def initialize(path="./db/mp3s")
    @path = path
    @library = MusicImporter.new(self.path)
    self.library.import
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
    answer = gets.strip
    until answer == "exit"
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
      answer = gets.strip
    end
  end

  def list_songs
    counter = 1
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    sorted_genres = Genre.all.sort_by {|genre| genre.name}
    sorted_genres.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.all.detect{|artist| artist.name == artist_name}
    if artist
      sorted_songs = artist.songs.sort_by{|song| song.name}
      counter = 1
      sorted_songs.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end


    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets.strip
      genre = Genre.all.detect{|genre| genre.name == genre_name}
      if genre
        sorted_genres = genre.songs.sort_by{|song| song.name}
        counter = 1
        sorted_genres.each do |song|
          puts "#{counter}. #{song.artist.name} - #{song.name}"
          counter += 1
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      song_number = gets.strip.to_i
      if song_number > 0 && song_number <= Song.all.size
        sorted = Song.all.sort_by{|song| song.name}
        song_choice = sorted[song_number - 1]
        puts "Playing #{song_choice.name} by #{song_choice.artist.name}"
      end
    end

end
