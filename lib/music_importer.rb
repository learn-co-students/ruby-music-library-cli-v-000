class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    Dir.glob("#{self.path}/*").collect { |file| File.basename(file) }
  end

  def import
    self.files.collect { |file| Song.create_from_filename(file) }
  end

end
