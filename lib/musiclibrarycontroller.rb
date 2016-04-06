class MusicLibraryController
  attr_accessor :path, :library
  def initialize(path= "./db/mp3s")
    @path=path
    @importer = MusicImporter.new(path)
    @library = @importer.import
    @library
  end
  def call
    "Hello and Welcome to the Music Library CLI! Your options are to 'list songs', 'list artists', 'list genres', or 'exit'."
    input = gets.strip
    if input == "list songs"
      list_songs
      puts "Would you like to play a song?"
      input = gets.strip
      if input == "Y"
        play_song
      else
        nil
      end
    elsif input == "list artists"
      list_artists
      list_artist_songs
      puts "Would you like to play a song?"
      input = gets.strip
      if input == "Y"
        play_song
      end
    elsif input == "list genres"
      list_genres
      puts "Would you like to play a song?"
      input = gets.strip
      if input == "Y"
        play_song
      end
    end
  end

  def list_songs
    array = []
    @filename_array = []
    @importer.files.each_with_index do |file, index|
      filename = file.split(".mp3")[0]
      @filename_array << filename
      array << "#{index + 1}. #{filename}"
    end
    array.each do |item|
      puts item
    end
  end
  def play_song
    puts "Which song would you like to play?"
      input = gets.strip.to_i
      index = input - 1
      song = @filename_array[index]
      puts "Playing #{song}"
  end

  def list_artists
    @library.collect do |song|
      puts song.artist.name
    end
  end
  def list_artist_songs
    input = gets.strip
    artist = Artist.find_or_create_by_name(input)
    artist.songs.collect do |song|
      puts song.name
    end
  end
  def list_genres
    @library.collect do |song|
      puts song.genre.name
    end
  end
end
