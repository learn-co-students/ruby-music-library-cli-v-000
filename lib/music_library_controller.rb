class MusicLibraryController

  attr_reader :path, :importer

  def initialize(path = "./db/mp3s")
    @path = path
    @importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    commands = []
    until input == "exit"
      input = gets.strip
      commands << input if input != "exit"
    end
    commands
  end

end
