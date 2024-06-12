class MusicLibraryController
  attr_accessor :path
  def initialize(path='./db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end
  def files
    Dir.foreach(@path) do |file|
      if file != "." && file !=".."
        @@files << file
      end
    end
    @@files
  end

  def call
    input = " "
    until input == "exit"
      "Would you like to either; list songs, list artists, list genres, play song, list artist, or list genre?"
      input = gets
      case input
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

  def list_songs
    i = 1
    Song.all.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i+=1
    end
  end
  def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end
  def list_genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end
  def play_song
    "Which song number?"
    input = gets.to_i - 1
    song = Song.all[input]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  def list_artist
    input = gets
    artist = Artist.find_by_name(input)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    input = gets
    genre = Genre.find_by_name(input)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
end
