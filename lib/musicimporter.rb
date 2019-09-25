class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    Dir.entries(@path).select {|filename| filename.include?(".mp3")}
  end
  def import
    self.files.map{|filename| Song.create_from_filename(filename)}
  end
end
