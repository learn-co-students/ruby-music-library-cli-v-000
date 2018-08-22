class MusicImporter

  attr_reader :path # the path should not be writeable


  def initialize(path)
    @path = path
  end

  def files # => loads all the mp3 files in the path directory
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")} # normalized the file name to just the mp3
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end
