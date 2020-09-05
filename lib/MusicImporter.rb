# Create a MusicImporter class that works with your Song, Genre, and Artist objects to import a directory of MP3 files.

class MusicImporter
  attr_reader :path

 # initialize -accepts a file path to a directory of MP3 files.
 
  def initialize(path)
    @path = path
  end

# files - returns all of the imported filenames.

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

# import - imports all of the files from the library, instantiating a new Song object for each file.

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end