class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    Dir["#{path}/*"].map {|x| x.gsub("#{path}/", "")}
  end
  def import
    self.files.each {|x| Song.create_from_filename(x)}
  end
end
