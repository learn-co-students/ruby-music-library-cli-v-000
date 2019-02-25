require 'pry'
class MusicImporter
  
  attr_reader :path 
  
   def initialize(path)
     @path= path 
    
   end 
    
   
   def files #loads all the MP3 files in the path directory
   @files = Dir.entries(@path)
   @files.delete_if { |file| file == "." || file == ".."}  #normalizes the filename to just the MP3 filename with no path
  
   end 
    
    def import
    files.each {|file| Song.create_from_filename(file)}
 
    end 
  
  
end 