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
      inputs << input
    end

    if inputs.include?("list songs")
      @music_importer.files.each do |file|
        puts "#{file.index + 1} #{file.slice(/(.)*.mp3/)}"
      end
    end
  end

end
