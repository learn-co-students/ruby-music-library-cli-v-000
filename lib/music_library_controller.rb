class MusicLibraryController

  attr_accessor :path, :lib

  def initialize(path = './db/mp3s')
    @path = path
   MusicImporter.new(@path).import


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

    input = gets.strip
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

    while input != "exit"
      input = gets.strip
    end

  end

  def list_songs
    Song.all.sort_by(&:name).each.with_index(1) do |song, idx|
      puts "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |art, idx|
      puts "#{idx}. #{art.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |g, idx|
      puts "#{idx}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort_by(&:name).each.with_index(1) do |song, idx|
        puts "#{idx}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each.with_index(1) do |song, idx|
        puts "#{idx}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if(1..Song.all.length).include?(input)
      song = Song.all.sort_by(&:name)[input-1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song

  end

end
