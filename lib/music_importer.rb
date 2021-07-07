require 'pry'
class MusicImporter
  
  attr_accessor :path, :name, :artist, :mp3
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    Dir.entries(@path).select {|file| file.include?(".mp3")}
  end
  
  def import
    files.each {|file| Song.create_from_filename(file)}
    
     
  end
end
     
  
     
 
  

#   def import
#   files.each { |file| file = Song.new_by_filename(}
    
#  files returns an array of all mp3's 
#  create a new song by $FILENAME pass
