class MusicLibraryController
  attr_accessor

  def initialize(path = "./db/mp3s")
    new_importer = MusicImporter.new(path)
    new_importer.import
  end

  def call
    input = nil
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip.downcase

      case input
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
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name}" + " - "+ "#{song.name}" + " - " + "#{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
       artist.songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name}" + " - " + "#{song.genre.name}"
      end
    end
    # binding.pry
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    if ary = Genre.find_by_name(genre_input)
      alpha = ary.songs.sort_by! {|a| a.name}
      ary.songs.each.with_index(1) do |song, i|
         puts "#{i}. #{song.artist.name}" + " - " + "#{song.name}"
      end
    end
  end

  def play_song
    library_size = Song.all.size
    song_input = nil
    puts "Which song number would you like to play?"
    song_input = gets.strip.to_i
    if song_input.between?(1,library_size)
      selection = Song.all[song_input.to_i-1]
      puts "Playing #{selection.name} by #{selection.artist.name}"
    end
  end
end
