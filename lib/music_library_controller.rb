class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.strip

      case input
      when "list artists"
        artists
      when "list genres"
        genres
      when "list songs"
        songs
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song       
      end
    end
  end

  def artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre}"
    end
  end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def play_song
    puts "Play which song number?"
    song = gets.strip
    puts "Playing #{Song.all[song.to_i+1]}"
  end

  def list_artist
    puts "What artist's songs are you looking for?"
    artist = gets.strip
    if a = Artist.find_by_name(artist)
      a.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  def list_genre
    puts "What genre's songs are you looking for?"
    genre = gets.strip
    if g = Genre.find_by_name(genre)
      g.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

end
