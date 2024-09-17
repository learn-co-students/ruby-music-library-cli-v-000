class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      user_input = gets.strip
      case user_input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
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

  def list_artist
    puts "What artist would you like to list the songs from?"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  def list_genre
    puts "What genre would you like to list the songs from?"
    genre_name = gets.strip
    if genre_name = Genre.find_by_name(genre_name)
      genre_name.songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip
    puts "Playing #{Song.all[song_number.to_i - 1]}"
  end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

end
