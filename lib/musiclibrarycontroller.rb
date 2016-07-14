class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path = "./db/mp3s")
    @path= path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  def music_importer
    @music_importer
  end

  def call
    input = nil
    puts "Hello, what would you like to do?"
    while input != "exit"
      input = gets
      case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "play song"
        song_number = gets
        self.play_song(song_number)
      when "list artist"
        artist = gets
        self.list_artist(artist)
      when "list genre"
        genre = gets
        self.list_genre(genre)
      else
        puts "Please enter a valid command"
      end
    end
  end

  def list_songs
    self.music_importer.files.each_with_index do |file, index|
      puts "#{index + 1}. #{file.slice(/(.)*.mp3/)}"
    end
  end

  def list_artists
    artists = []
    self.music_importer.songs.each do |song|
      artists << song.artist.name
    end
    puts "#{artists.uniq}"
  end

  def list_genres
    genres = []
    self.music_importer.songs.each do |song|
      genres << song.genre.name
    end
    puts "#{genres.uniq}"
  end

  def play_song(song_number)
    self.music_importer.files.each_with_index do |file, index|
      if index + 1 == song_number
        puts "Playing #{file.slice(/(.*).mp3/)}"
      end
    end
  end

  def list_artist(artist)
    self.music_importer.files.each do |file|
      if file.include?(artist)
        puts "#{file.slice(/(.)*.mp3/)}"
      end
    end
  end

  def list_genre(genre)
    self.music_importer.files.each do |file|
      if file.include?(genre)
        puts "#{file.slice(/(.)*.mp3/)}"
      end
    end
  end

end
