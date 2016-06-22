class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
  end

  def call
    response = gets.chomp
    self.call unless response == "exit"
  end
end