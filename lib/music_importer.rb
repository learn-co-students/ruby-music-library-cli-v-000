require 'pry'

class MusicImporter
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path 
  end 
  
  def files 
   # binding.pry
   Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/", '') }
  end
  
  
end 