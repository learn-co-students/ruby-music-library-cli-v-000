require "pry"

class MusicImporter

  def initialize(path) #Accepts a filepath to a directory of MP3 files.
    @path = path #Initialze an instance @path with the passed-in info from the file.
  end

  def path
    @path #Path to the directory holding the files ( "./spec/fixtures/mp3s")
  end

  def files #Loads all mp3 files (excludes non-song files). remove the path info at the start of the file
    files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "")}
  end
  #Dir.entries V Dir.glob: Dir.entries returns an array containing all of the filenames in the given directory (but cannot exclude the unwanted (not .mp3 files) file this method??. Dir.glob will return all of the files the match that parameters you pass in. ("#{@path}/*.mp3") Will search for al of the files (in the @path) that end with (*) the .mp3.
  #def files: Old method from collab object lab (not very flexible in the future to use if the only bad files where the "." and the ".."):
  #...@files = Dir.entries(@path)
  #...@files.delete_if {|file| file == "." || file == ".."}

  def import #Class method. Imports all of the files from the library and creates a new song object for each file.
    files.each { |filename| Song.create_from_filename(filename)} #calling the Song.create_from_filename method here????
    #Song object calls on its song class method (create_from_filename). Since this method already creates new song objects correctly from the filename, they will all be imported correctly now that I call this method here.
  end
end
