class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path = "./db/mp3s")
    @path= path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  def call
    puts "Hello, what would you like to do?"
    input = gets

    if input == "list songs"
      self.list_songs
    end

    if input == "list artists"
      self.list_artists
    end

    if input == "list genres"
      self.list_genres
    end

    if input == "exit"
      return exit
    end

  end

  def list_songs
    @music_importer.files.each do |file|
      puts "#{file.index + 1} #{file.slice(/(.)*.mp3/)}"
    end
  end

  def list_artists
    artists = []
    @music_importer.songs.each do |song|
      artists << song.artist.name
    end
    puts "#{artists.uniq}"
  end

  def list_genres
    genres = []
    @music_importer.songs.each do |song|
      genres << song.genre.name
    end
    puts "#{genres.uniq}"
  end

  def play_song(song_number)
  end


end
