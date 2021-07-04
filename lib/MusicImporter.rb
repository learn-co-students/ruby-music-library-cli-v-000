class MusicImporter 
  
  attr_accessor :path, :musiclibrarycontroller
  
  def initialize(path = "./db/mp3s/")
       @path = path 
  end 
  
  def files 
  Dir.glob("./#{path}/*.mp3").collect{|file| file.gsub("./#{path}/", '')}.sort
  end 


def import
    files.each { |file| Song.create_from_filename(file) }
  end 






end 


