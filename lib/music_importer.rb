class MusicImporter

  attr_accessor :song, :artist, :genre, :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def self.import
  end

end
