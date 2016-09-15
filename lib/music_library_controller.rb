class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
      puts "Welcome to your Music Library!"
    while input != "exit"
      puts "Please enter one of the following:"
      puts "list songs, list artists, list genres, list artist, list genre, play song."
      puts "Enter exit at any time to end your session."
      input = gets.strip

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        artist_name
      when "list genre"
        song_genre
      when "play song"
        play_song
      when "exit"
        puts "Thank you for using the Music Library!"
      end
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def list_artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist}"
    end
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre}"
    end
  end

  def artist_name
    puts "What artist would you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |artist, index|
        puts "#{index}. #{artist}"
      end
    end
  end

  def song_genre
    puts "What genre would you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  def play_song
    puts "Enter the number of the song you would like to play."
    song_input = gets.strip
    Song.all.each do |song|
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
