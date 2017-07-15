require "pry"

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    library = MusicImporter.new(path)
    library.import
  end

  def call
      puts "Welcome to your music library!"
      self.menu
  end

  def menu
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    case gets.chomp.downcase
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
      when "exit"
        "exit"
      else
        self.menu
    end
  end

  def generate_song_list
    Song.all.sort_by {|song| song.name}
  end

  def list_songs
    counter = 0
    songs = self.generate_song_list

    songs.each do |song|
      counter += 1
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    counter = 0
    artists = Artist.all.sort_by {|artist| artist.name}

    artists.each do |artist|
      counter += 1
      puts "#{counter}. #{artist.name}"
    end
  end

  def list_genres
    counter = 0
    genres = Genre.all
    genres_sorted = genres.sort_by {|genre| genre.name}

    genres_sorted.each do |genre|
      counter += 1
      puts "#{counter}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)

    if artist != nil
      song_list = artist.songs.sort_by {|song| song.name}
      counter = 0

      song_list.each do |song|
        counter += 1
        puts "#{counter}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)

    if genre != nil
      song_list = genre.songs.sort_by {|song| song.name}
      counter = 0

      song_list.each do |song|
        counter += 1
        puts "#{counter}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i - 1
    song_list = self.generate_song_list
    song = song_list[input]

    if input > 0 && input <= Song.all.length && song != nil
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
