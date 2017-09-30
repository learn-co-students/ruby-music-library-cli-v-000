class MusicLibraryController

  def initialize(path= './db/mp3s')
    importer = MusicImporter.new(path)
    @collection = importer.import
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
      answer = gets.chomp

      case answer
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_songs_by_artist
        when "list genre"
          list_songs_by_genre
        when "play song"
          play_song
      end

      break if answer == "exit"
    end
  end

  def list_songs
    songs = Song.all
    sorted = songs.uniq.sort { |a, b| a.name <=> b.name }
    sorted.each_with_index do |entry, index|
      puts "#{index + 1}. #{entry.artist.name} - #{entry.name} - #{entry.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all
    sorted = artists.uniq.sort { |a, b| a.name <=> b.name }
    sorted.each_with_index do |entry, index|
      puts "#{index + 1}. #{entry.name}"
    end
  end

  def list_genres
    genres = Genre.all
    sorted = genres.uniq.sort { |a, b| a.name <=> b.name }
    sorted.each_with_index do |entry, index|
      puts "#{index + 1}. #{entry.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    singer = Artist.find_or_create_by_name(artist)
    sorted = singer.songs.sort { |a, b| a.song.name <=> b.song.name }
    sorted.songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end
end
