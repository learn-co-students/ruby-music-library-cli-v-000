class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + "/*"].map { |song| File.basename(song) }
  end

  def import
    files.each { |filename| Song.create_from_filename(filename) }
  end
end
