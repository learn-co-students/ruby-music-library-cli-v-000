require "pry"

class MusicImporter
  
  attr_accessor :path 
  attr_reader :files 
  
  def initialize(path)
    @path = path 
    
  end
  
  def files
    @files = Dir.entries(@path).select {|file_name| file_name.include?("mp3")}
  end
  
  def import 
    self.files.each do |file_name| 
      Song.create_from_filename(file_name)
    end
  end
  
  
  
end