class MusicLibraryController
  attr_reader :path

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    choice = ""
    while choice != "exit"
      puts "Welcome to your Music Library"
      puts "What would you like to see?"
      choice = gets.strip

      case choice
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
    puts "What song number would you like to play?"
    song_index = gets.strip
    puts "Playing #{Song.all[song_index.to_i-1].artist.name} - #{Song.all[song_index.to_i-1].name} - #{Song.all[song_index.to_i-1].genre.name}"
  end

  def list_artist
    puts "What artists songs would you like to see"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "What genre of songs would you like to see"
    song_genre = gets.strip
    if genre = Genre.find_by_name(song_genre)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end