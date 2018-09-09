class MusicLibraryController
  DEFAULT_PATH = "./db/mp3s"

  def initialize(path = DEFAULT_PATH)
    MusicImporter.new(path).import
  end

  def call
    choice = ""
    while choice != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      choice = gets.strip

      if choice == "list songs"
        list_songs
      elsif choice == "list artists"
        list_artists
      elsif choice == "list genres"
        list_genres
      elsif choice == "list artist"
        list_songs_by_artist
      elsif choice == "list genre"
        list_songs_by_genre
      elsif choice == "play song"
        play_song
      end
    end
  end

  def list_songs
    songs = Song.all.sort{ |a, b| a.name <=> b.name }
    songs.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort{ |a, b| a.name <=> b.name }
    artists.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort{ |a, b| a.name <=> b.name }
    genres.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip
    artist = Artist.find_by_name(artist_input)
    if !artist.nil?
      artist.songs.sort!{ |a, b| a.name <=> b.name }
      artist.songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
    if !genre.nil?
      genre.songs.sort!{ |a, b| a.name <=> b.name }
      genre.songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    play_song_input = gets.strip.to_i
    if play_song_input >= 1 && play_song_input <= Song.all.length
      song = Song.all.sort{ |a, b| a.name <=> b.name }[play_song_input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
