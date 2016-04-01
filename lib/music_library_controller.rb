class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def greet
    puts "Welcome to your music library! Please select from the following commands:"
    puts "list songs"
    puts "list artists"
    puts "list genres"
    puts "list artists"
    puts "list genres"
    puts "play song"
    puts "exit"
  end

  def call
    selection = ""
    while selection != "exit"
      greet
      selection = gets.strip
      case selection
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_artist_songs
      when "list genre"
        list_genre_songs
      when "play song"
        play_song
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

  def list_artist_songs
    puts "Enter artist:"
    selection = gets.strip
    if artist = Artist.find_by_name(selection)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre_songs
    puts "Enter genre:"
    selection = gets.strip
    if genre = Genre.find_by_name(selection)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def play_song
    puts "Enter song number:"
    selection = gets.strip.to_i - 1
    puts "Playing #{Song.all[selection].artist.name} - #{Song.all[selection].name} - #{Song.all[selection].genre.name}"
  end
end