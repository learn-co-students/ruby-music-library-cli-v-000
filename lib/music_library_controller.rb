class MusicLibraryController
  attr_reader :path

  def initialize(path="./db/mp3s")
    @path = path
    music_file = MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
      input = gets.chomp
    end
  end
end