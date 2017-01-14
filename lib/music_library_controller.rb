class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
  puts "What do you want to listen to?" until gets "exit"
  end

end
