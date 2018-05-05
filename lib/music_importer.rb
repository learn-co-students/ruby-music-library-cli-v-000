class MusicImporter
  attr_reader :path        # accepts a file path to parse MP3 files from

  def initialize(path)     # retrieves the path provided to the MusicImporter object
    @path = path
  end

  def files                 # loads all the MP3 files in the path directory / normalizes the filename to just the MP3 filename with no path
    @files ||= Dir.glob("#{path}/*.mp3").collect { |f| f.gsub("#{path}/", "")}
  end
  def import                # imports the files into the library by invoking Song.create_from_filename
    files.each{ |f| Song.create_from_filename(f)}
  end
end
