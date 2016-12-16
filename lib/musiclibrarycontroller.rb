class MusicLibraryController
  attr_accessor :path 

  def initialize(path='./db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    MusicLibraryController.new
    input = ""
    while input != "exit"
      puts "========== Music Library CLI =========="
      puts "What do you want to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list genre"
        list_genre
      when "list artist"
        list_artist
      end
    end
  end

  def songs
    Song.all.each_with_index { |song, i| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def artists
    Artist.all.each { |artist| puts "#{artist.name}" }
  end

  def genres
    Song.all.each { |song| puts "#{song.genre}" }
  end

  def play_song
    puts "Select song number you want to play: "
    input = gets.strip
    puts "Playing #{Song.all[input - 1]}"
  end

  def list_artist
    puts "What artist by name would you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |song, i|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "What genre do you want to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each.with_index do |g, i|
        puts "#{i}. #{g}"
      end
    end
  end
end