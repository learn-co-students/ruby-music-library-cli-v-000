require "pry"

class MusicLibraryController

  def initialize (path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input  = nil
    until input == "exit"
      input = gets
    end
  end


end