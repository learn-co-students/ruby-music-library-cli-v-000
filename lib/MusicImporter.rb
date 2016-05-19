class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    directories = Dir.entries(@path)
    directories.delete(".")
    directories.delete("..")
    directories
  end

end