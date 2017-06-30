require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    #binding.pry
  end

  def files
    #this method needs to return all the file in the mp3 folder
     Dir[@path+"/*.mp3"].map do |file|
      file.split("/").last
     end
  end

  def import
    files.map do |file|
      Song.create_from_filename(file)
    end
  end

end
