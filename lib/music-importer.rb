
class MusicImporter

  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir.entries(self.path).select { |f| !File.directory? f}
  end

  def import
    self.files.each { |song| Song.create_from_filename(song) }
  end

end
