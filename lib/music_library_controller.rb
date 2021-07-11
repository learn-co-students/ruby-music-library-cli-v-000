class MusicLibraryController

  INPUT_OPTIONS = ['list songs', 'list artists', 'list genres',
                  'list artist', 'list genre', 'play song', 'exit']

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  # Upon initialization, accepts an optional path to the
  # library of MP3 files, defaulting to ./db/mp3s/.
  # It should then instantiate a MusicImporter object,
  # which it will use to import songs from the specified library.

  def call

    input = ""

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
    when 'list songs'
      list_songs
    when 'list artists'
      list_artists
    when 'list genres'
      list_genres
    when 'list artist'
      list_songs_by_artist
    when 'list genre'
      list_songs_by_genre
    when 'play song'
      play_song
    end

    call unless input == 'exit'
  end

  def list_songs
    alphabetized_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def alphabetized_songs
    Song.all.sort_by {|song| song.name}
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.all.find {|artist| artist.name == artist_name}
    if artist
      artist.songs.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.all.find {|genre| genre.name == genre_name}
    if genre
      genre.songs.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    song_index = gets.strip.to_i

    if song_index > 0 && song_index <= Song.all.count
      song = alphabetized_songs[song_index - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
