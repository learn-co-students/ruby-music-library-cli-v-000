require 'pry'
class MusicImporter

 attr_accessor :path, :each_file

 def initialize(path)
   @path = path

 end

 def files 
     Dir["#{@path}/*.mp3"]
      
     files = Dir["#{@path}/*.mp3"]
     
     @each_file = []

     files.each{|x|@each_file  << File.basename(x)}
     @each_file
  
 end

  def import 
    
    
     self.files.each{ |x|
    
      Song.create_from_filename(x)
       
       }
     

   end


end 

