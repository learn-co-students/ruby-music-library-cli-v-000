class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    input = nil
     while input != "exit"
      puts "Welcome to your music library. What would you like to do? You can say:"
      puts "list songs"
      puts "list artists"
      puts "list genres"
      puts "play song"
      puts "list artist"
      puts "list genre"
      input = gets.strip.downcase
      case input
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
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def play_song
    puts "Please enter the number of the song you would like to play."
    input = gets.strip.to_i
    selection = Song.all[input-1]
    puts "Playing #{selection.artist.name} - #{selection.name} - #{selection.genre.name}"
  end

  def list_artist
    puts "Which artist's songs would you like to list?"
    input = gets.strip
    chosen_artist = Artist.find_by_name(input)
    chosen_artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "Please enter a genre."
    input = gets.strip
    chosen_genre = Genre.find_by_name(input)
    chosen_genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end