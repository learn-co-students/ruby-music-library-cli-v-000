class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path= path
  end

  def files
    x = Dir.entries(path)
    x.shift
    x.shift
    x
  end

  def import
    x = self.files
    x.each {|y| Song.create_from_filename(y)}
  end
end
