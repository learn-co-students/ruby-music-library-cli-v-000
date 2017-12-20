require 'pry'

# create MusicImporter class 
class MusicImporter

    extend Concerns::Findable
# create initialize method w/(file_path) argument
  def initialize(path) 
    @path = path 
    @songs = []
  end 
# create path method - no arguments
  def path # getter method 
    # - this method will get the path passed through the MusicImporter object
    @path
  end

  def add_song(song) 
    @songs << song
  end
# create files method
  def files 
  # this method will add the MP3 files into the path directory 
  # - set to empty array to store files?  
    
    mp3_music = Dir.entries(path).reject {|item| item == "." || item  == ".."} # Dir.entries - gets items from Mp3 folder
      mp3_music
  end 
  
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end 
#      Song.
    # look into the directory path - and create a song object from files 
   # how do I connect/access song since it is not available in MusicImporter 
  end 
  
end 