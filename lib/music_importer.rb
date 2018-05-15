class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select { |file| !File.directory? file }
  end

  def import
    self.files.each { |filename| Song.create_from_filename(filename) }
  end
end
