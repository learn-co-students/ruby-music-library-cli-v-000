class MusicLibraryController

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to your Music Library"
      puts "Do you know what you'd like to do? Type 'help' for help, or 'exit' to exit music library"
      user_input = gets.strip
      case user_input
        when "list artists"
          artists
        when "list songs"
          songs
        when "list genres"
          genres
        when "list artist"
          list_artist
        when "list genre"
          list_genre
        when "play song"
          play_song
        when "help"
          help
      end
    end
  end

  def artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist}"
    end
  end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre}"
    end
  end

  def list_artist
    puts "For which artist would you like to see a song list?"
    artist = gets.strip
    if existing_artist = Artist.find_by_name(artist)
      existing_artist.songs.each_with_index do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  def list_genre
    puts "For which genre would you like to see a song list?"
    genre = gets.strip
    if existing_genre = Genre.find_by_name(genre)
      existing_genre.songs.each_with_index do |song, index|
        puts "#{index}. #{song}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play (please put an integer)?"
    song_number = gets.strip.to_i - 1
    song = Song.all[song_number]
    puts "Playing #{song}"
  end

  def help
    puts "Available actions:"
    puts "list songs"
    puts "list artists"
    puts "list genres"
    puts "list artist"
    puts "list genre"
    puts "play song"
    puts "exit"
  end

end