class MusicImporter
  attr_reader :path

  def initialize(path)
    #accepts a file path to a directory of MP3 files
    @path = path
  end

  def files
    #returns all imported filenames
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    # imports all files from library, instantiating a new song object for each file
    files.each{ |f| Song.create_from_filename(f) }
  end
end
