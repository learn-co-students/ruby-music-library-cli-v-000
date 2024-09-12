class MusicImporter
attr_reader :path
  def initialize(path)
    @path = path
  end

def files
  @files = Dir.entries(path)
  @files.delete(".")
  @files.delete("..")
  @files
end

end