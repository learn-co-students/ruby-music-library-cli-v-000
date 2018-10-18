require "pry"

class MusicImporter
  
  attr_accessor :path, :files 
  
  def initialize(path)
    @path = path 
    
  end
  
  def files
    @files = Dir.glob("#{@path}/*.mp3").collect{|file| file.to_s.slice(21..-1)}
    binding.pry 
  end
  
  def self.import 
    self.files.each do |file_name| 
      Song.new_by_filename(file_name)
    end
  end
  
  
  
end