class MusicImporter
  attr_accessor :path
  attr_reader :artist, :song, :genre

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path)
  end

  def import
    self.files.each {|file| file.split(/[-\.]/).strip}
  end

end
