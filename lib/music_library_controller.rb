class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Hello"
      puts "What would you have me do?"
      input = gets.chomp
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
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
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
    Song.all.each do |song|
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artist
    puts "What artist's songs would you like to see"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "What genre of songs would you like to see?"
    song_genre = gets.strip
    if genre = Genre.find_by_name(song_genre)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end
