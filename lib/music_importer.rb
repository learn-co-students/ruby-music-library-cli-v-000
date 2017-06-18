class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|f| !File.directory? f}.sort
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end
