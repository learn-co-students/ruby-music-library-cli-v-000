class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path = "./db/mp3s")
    @path= path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  def call
    input = nil
    inputs = []
    while input != "exit" do
      input = gets
      puts "#{input}"
      inputs << input
    end
    if inputs.include?("list songs")
      self.list_songs
    end

    if inputs.include?("list artists")
      self.list_artists
    end
  end

  def list_songs
    @music_importer.files.each do |file|
      puts "#{file.index + 1} #{file.slice(/(.)*.mp3/)}"
    end
  end

  def list_artists
    @music_importer.songs.each do |song|
      puts "#{song.artist}"
    end
  end

end
