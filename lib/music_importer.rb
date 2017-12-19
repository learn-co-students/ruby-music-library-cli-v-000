require 'pry'

# create MusicImporter class 
class MusicImporter

# create initialize method w/(file_path) argument
  def initialize(path) 
    @path = path 
  end 
# create path method - no arguments
  def path # getter method 
    # - this method will get the path passed through the MusicImporter object
    @path
  end

# create files method
  def files 
  # this method will add the MP3 files into the path directory 
    @files = [] # - set to empty array to store files?
  end 
  
end 