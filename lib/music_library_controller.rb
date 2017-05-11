class MusicLibraryController

  attr_accessor :path

  def initialize(path= "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = gets.chomp
  end
end
