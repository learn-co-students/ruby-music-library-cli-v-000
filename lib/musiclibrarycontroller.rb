class MusicLibraryController
  attr_accessor :music_importer

  def initialize(path="./db/mp3s")
    @music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""
    loop do
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

      if input == "exit"
        break
      end

      if input == "list songs"
        self.list_songs
        break
      end

      if input == "list artists"
        self.list_artists
        break
      end

      if input == "list genres"
        self.list_genres
        break
      end

      if input == "list artist"
        self.list_songs_by_artist
        break
      end

      if input == "list genre"
        self.list_songs_by_genre
        break
      end

      if input == "play song"
        self.play_song
        break
      end
    end
  end

  def list_songs
    songs = []
    i = 0
    Song.all.each { |song| songs << song }
    songs_sorted = songs.sort { |e,f| e.name <=> f.name}
    songs_sorted.uniq.each { |song|
      i += 1
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end

  def list_artists
    i = 0
    artists_name = []
    Artist.all.each { |artist| artists_name << artist.name}
    artists_name.sort.uniq.each { |name|
      i += 1
      puts "#{i}. #{name}"
    }
  end

  def list_genres
    i = 0
    genres_name = []
    Genre.all.each { |genre| genres_name << genre.name}
    genres_name.sort.uniq.each { |name|
      i += 1
      puts "#{i}. #{name}"
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    i = 0
    songs = []
    songs = Song.all.select { |song| song.artist.name == input}
    songs_sorted = songs.sort { |e,f| e.name <=> f.name}
    songs_sorted.uniq.each { |song|
      i += 1
      puts "#{i}. #{song.name} - #{song.genre.name}"
    }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    i = 0
    songs = Song.all.select { |song| song.genre.name == input}
    songs_sorted = songs.sort { |e,f| e.name <=> f.name}
    songs_sorted.uniq.each { |song|
      i += 1
      puts "#{i}. #{song.artist.name} - #{song.name}"
    }
  end

  def play_song
    input = ""
    puts "Which song number would you like to play?"
      input = gets.strip
      songs_sorted = Song.all.sort { |e,f| e.name <=> f.name}
      if input.to_i <= songs_sorted.uniq.size && input.to_i != 0
        puts "Playing #{songs_sorted.uniq[input.to_i - 1].name} by #{songs_sorted.uniq[input.to_i - 1].artist.name}"
      end
  end

end
