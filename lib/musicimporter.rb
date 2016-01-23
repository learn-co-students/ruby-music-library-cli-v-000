class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  # A files method that will return all of the filenames
  def files
    Dir["#{path}/*.mp3"].collect do |x|
      File.basename(x)
    end


  end

#In your MusicImporter class, add an .import method that imports all the files from the 
#library and creates the Song objects.

  def self.import 

  end



end