class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).delete_if{|el| el == "." || el == ".."}
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end
