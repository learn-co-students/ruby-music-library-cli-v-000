class MusicImporter
  attr_accessor :path#retrieves the path provided to the MusicImporter object

  def initialize(path)
    @path = path#accepts a file path to parse MP3 files from
  end

  def files
     Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|filename| Song.create_from_filename(filename)}
  end


end
