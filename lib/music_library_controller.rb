class MusicLibraryController

  extend Concerns::Findable
  attr_accessor :input, :library, :path

  def initialize(path = "./db/mp3s")
    @path = path
    @library = MusicImporter.new(@path)
    @library.import
  end

  def call
    puts "Your Music Library"
    input = ""
    while input != "exit"
      puts "Choose an option: list songs, list artist, list genres, play song, list artist, list genre, or exit"
      input = gets.chomp
      if input == "list songs"
        songs
      elsif input == "list artists"
        artists
      elsif input == "list genres"
        genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        artist_songs
      elsif input == "list genre"
        genre_songs
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
    puts "Choose a song number."
    song_input = gets.chomp
    puts "Playing #{Song.all[song_input.to_i-1].artist.name} - #{Song.all[song_input.to_i-1].name} - #{Song.all[song_input.to_i-1].genre.name}"
  end

  def artist_songs
    puts "Choose an artist."
    artist_input = gets.chomp
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
  

  def genre_songs
    puts "Choose a genre."
    genre_input = gets.chomp
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end 
  end

end