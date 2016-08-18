class MusicLibraryController

  attr_reader :path

  def initialize(path='./db/mp3s')
    new = MusicImporter.new(path)
    new.import
  end

  def call
    "list songs"
    while input = gets.chomp
      break if input == "exit"
    end
    "exit"
  end
end
