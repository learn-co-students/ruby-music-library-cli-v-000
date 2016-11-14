class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).reject { |f| File.directory?(f) }
  end

  def import
    self.files.each { |filename| Song.create_from_filename(filename) }
  end
end
