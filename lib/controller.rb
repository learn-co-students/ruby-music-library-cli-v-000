class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    self.path = path
    MusicImporter.new(path).import
  end
  def call
    puts "Input Here"
    path = gets
  end
end