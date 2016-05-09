class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|x| x.length > 2}
  end

  def import
    files.each {|filename|Song.create_from_filename(filename)}
  end

end