class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importing = MusicImporter.new(path)
    importing.import
  end

  def call
    user_input = ""

    until user_input == "exit"
      puts "Welcome!"
      puts "What would you like to do?"
      user_input = gets.strip

      case user_input
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

  def play_song
    puts "What would you like to play?"
    input_song = gets.strip.to_i
    song = Song.all[input_song - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

  end

  def list_artist
    puts "What artist?"
    input_artist = gets.strip
    if artist = Artist.find_by_name(input_artist)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_genre
    input_genre = gets.strip
    if genre = Genre.find_by_name(input_genre)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end
