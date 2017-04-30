require 'pry'

class MusicImporter
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
  end 
  
  def files
    self.files =  Dir.entries(@path).reject! do |file_name|
      file_name !~ /\.mp3$/ 
    end
  end
  
  def import
    self.files.collect do |file_name|
      Song.create_from_filename(file_name)
    end
  end
  
    
end