class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    list = Dir.entries(@path).select {|filename| filename[-3..-1] == "mp3" }
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end

end
