class MusicImporter
  attr_reader :path, :array

  def initialize(path)
    @path = path
    @array = []
  end

  def files
    @array = Dir.entries(@path).grep(/mp3/)
  end

end
