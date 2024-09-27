class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end

  def call

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
        return
      elsif input == "list songs"
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

  def list_songs
    songs = Song.all.sort { |a, b| a.name <=> b.name }
    songs.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    artists = Artist.all.sort { |a, b| a.name <=> b.name }
    artists.each.with_index(1) { |artist, index| puts "#{index}. #{artist.name}" }

  end

  def list_genres
    genres = Genre.all.sort { |a, b| a.name <=> b.name  }
    genres.each.with_index(1) { |genre, index| puts "#{index}. #{genre.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_or_create_by_name(input)
    artist_songs = artist.songs.sort { |a, b| a.name <=> b.name }
    artist_songs.each.with_index(1) { |song, index| puts "#{index}. #{song.name} - #{song.genre.name}" }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_or_create_by_name(input)
    genre_songs = genre.songs.sort { |a, b| a.name <=> b.name }
    genre_songs.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name}" }
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input >= 1 && input <= Song.all.length
      songs = Song.all.sort { |a, b| a.name <=> b.name }[input - 1]
      puts "Playing #{songs.name} by #{songs.artist.name}"
    end
  end

end
