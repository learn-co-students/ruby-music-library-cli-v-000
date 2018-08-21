require 'pry'

class MusicImporter 
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files 
    files_array = Dir[@path + "/*.mp3"]
    files_array.collect do |file|
       file.split("/")[-1]
       #binding.pry
    end
  end
  
  def import
    new_files = self.files
    files_array.each{|filename| Song.create_from_filename(filename)}
  end
  binding.pry
end