require 'pry'

class MusicImporter
  attr_accessor :path # Not putting :files in here, as it doesnt require explicit reader method
  #and is being populated by methods below

  def initialize(path) # Initializes with a given path name of the folder with files
    self.path = path
    @files = []
  end

  def files
    #Dir.chdir(path) #Alternate method to change the directory to path and then only receive file names
    @files = Dir.glob("#{path}/*.mp3") #Collects all the file names as an array
    #@files = Dir.glob("*.mp3") #To be used with the alternate method above...will only give file names w/o path
    @files.collect! {|x| File.basename(x)} #Removes the path name from the file
  end

  def import
    self.files #Runs the #files for @files to be populated
    @files.each {|song| Song.create_from_filename(song)} #Sends each file to be created as Song instance
  end
end
