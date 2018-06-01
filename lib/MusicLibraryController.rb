require "pry"

class MusicLibraryController
  def initialize(library_path = './db/mp3s')
    music_importer_object = MusicImporter.new(library_path)
    #how use objet to kall import method from MusicImporter Klass?
  end
  
  def MusicImporter
    @path = path
  end
end