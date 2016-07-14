class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path = "./db/mp3s")
    @path= path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  def music_importer
    @music_importer
  end

  def call
    input = ""
    while input != "exit"
      puts "Hello, what would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "exit"
        break
      else
        puts "Please enter a valid command"
      end
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    puts "Enter the song number"
    song_number = gets.strip
    if song = Song.all[song_number.to_i - 1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    else
      puts "Song does not exist"
    end
  end

  def list_artist
    puts "Enter an artist"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "Enter a genre"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{genre.name}"
      end
    end
  end

end
