class MusicLibraryController

  def initialize(import_path="./db/mp3s")
    @input = nil
    MusicImporter.new(import_path).import
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

    while @input != "exit" do
      @input = gets.strip

      case @input
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
    songs = Song.all.sort { |a, b| a.name <=> b.name }

    songs.each.with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort { |a, b| a.name <=> b.name }

    artists.each.with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort { |a, b| a.name <=> b.name }

    genres.each.with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    @input = gets.strip
    artist = Artist.find_by_name(@input)

    if artist != nil
      songs = artist.songs.sort { |a, b| a.name <=> b.name }
      songs.each.with_index { |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    @input = gets.strip
    genre = Genre.find_by_name(@input)

    if genre != nil
      songs = genre.songs.sort { |a, b| a.name <=> b.name }
      songs.each.with_index { |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      }
    end
  end

  def play_song
    songs = Song.all.sort { |a, b| a.name <=> b.name }
    puts "Which song number would you like to play?"
    @input = gets.strip

    if @input.to_i <= songs.length && @input.to_i > 0
      puts "Playing #{songs[@input.to_i - 1].name} by #{songs[@input.to_i - 1].artist.name}"
    end
  end

end#endof class
