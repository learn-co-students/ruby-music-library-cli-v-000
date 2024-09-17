class MusicImporter

  attr_accessor :path, :songs

  def initialize(path)
    @path = path
  end

  # A files method that will return all of the filenames
  def files
   @files = Dir["#{path}/*.mp3"].collect do |x|
      File.basename(x)
    end


  end

#In your MusicImporter class, add an .import method that imports all the files from the 
#library and creates the Song objects.

  def import 
    files.each {|x| Song.create_from_filename(x) }


  end



end