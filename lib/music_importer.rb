

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).delete_if{|i| i == "." || i == ".."}
  end

  def import
    files.each{|i| Song.create_from_filename(i)}
  end
end
