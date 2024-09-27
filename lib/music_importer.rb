class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(self.path).reject{|f| f == "." || f == ".."}
  end

  def import
    self.files.each{|f| Song.create_from_filename(f)}
  end
end
