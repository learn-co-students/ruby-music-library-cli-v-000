
class MusicImporter

  attr_reader :path

  def initialize(path)
    # accepts a file path to parse MP3 files from
    # retrieves the path provided to the MusicImporter object
    @path = path
  end

  def files
    files = [ ]
    # loads all the MP3 files in the path directory
    # normalizes the filename to just the MP3 filename with no path
    Dir.glob("#{path}/*.mp3").collect do |file|
      files << file.gsub("#{path}/", "")
    end
    files
  end

  def import
    # imports the files into the library by invoking Song.create_from_filename
    files.each {|filename|Song.create_from_filename(filename)}
  end
end