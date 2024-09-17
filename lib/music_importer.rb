#   file path "./spec/fixtures/mp3s"

class MusicImporter
    attr_accessor :path

    def initialize(path)
      @path = path
      @files = []
    end
    def files
      #lets read the filepath directory and make an array of the file names in the folder.....
      #the bottom code does the following:
      #Dir.entries("") this takes in a string of a file path and will convert the file names within that folder into an array.
      #But this array will also give you 2 additional elements of ".." and ".".  The delete.if portion of the code removes the additional elements
        Dir.entries("#{path}").delete_if {|x| x==".." || x=="."}

    end
    #lets import the file list array, for each file lets create a new song with the filename off the Song class

    def import
      self.files.each {|file| Song.create_from_filename(file)}

    end

end
