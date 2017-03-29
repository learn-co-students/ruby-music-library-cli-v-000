class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def songs
    Song.all.sort_by!{|a| a.artist.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each do |artist|
      puts "#{artist}"
    end
  end

  def genres
    Genre.all.each do |genre|
      puts "#{genre}"
    end
  end

  def play_song
    puts "What track?"
    user_input = gets.strip.to_i
    song = Song.all[user_input - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist_songs
    puts "Which artist?"
    user_request = gets.strip
    artist = Artist.find_by_name(user_request)
    artist.songs.collect do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre_songs
    puts "What genre?"
    user_request = gets.strip
    genre = Genre.find_by_name(user_request)
    genre.songs.collect do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def call
      puts "Welcome to your music library!"
      puts "What would you like to listen to?"
      user_input = gets.strip
      case user_input
      when "list songs"
        songs
        call
      when "list artists"
        artists
        call
      when "list genres"
        genres
        call
      when "list artist"
        list_artist_songs
        call
      when "list genre"
        list_genre_songs
        call
      when "play song"
        play_song
        call
      when "exit"
        puts "Exiting"
      else
        puts "Invalid input"
        call
      end
  end

end
