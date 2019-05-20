class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).keep_if {|x| x.end_with?(".mp3")}
  end

  def import
    self.files.map {|x| Song.create_from_filename(x)}
  end
end
