class MusicLibraryController

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to Terminal Tunes"
      puts "Make a Selection:"
      puts "| list songs | list artists | list genres |"
      puts "| play song  | list artist  | list genre  |"
      user_input = gets.chomp
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

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
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

  def play_song
    puts "What song do you want to hear?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1]}"
  end

  def list_artist
    puts "Select an artist to list their songs"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  def list_genre
    puts "Select a genre to list songs"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end
end