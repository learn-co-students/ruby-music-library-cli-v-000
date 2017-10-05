class MusicImporter
  attr_accessor :path     #retrieves the path provided to the MusicImporter object

  def initialize(path)
    @path = path          #accepts a file path to parse MP3 files from
  end

  def files
    files = []
    Dir.new(self.path).each do |file|     #loads all the MP3 files in the path directory
      files << file if file.length > 4    #normalizes the filename to just the MP3 filename with no path
    end
    files
  end
# def files
#   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
# end

  def import                  #imports the files into the library by invoking Song.create_from_filename
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
