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
      if gets == "list songs"
        Song.all.each {|song| puts "#{song.index}. #{song.artist} - #{song.name} - #{song.genre}"}
      end
    end
  end


end