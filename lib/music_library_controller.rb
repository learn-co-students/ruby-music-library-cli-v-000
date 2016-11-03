require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(file_path = "./db/mp3s")
    importer = MusicImporter.new(file_path)
    importer.import
  end

  def call

  end 
end
