class MusicImporter

  attr_accessor :path, :song, :artist, :genre, :files

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    self.files.each {|f| Song.create_from_filename(f) }
  end
end
