class MusicImporter
  attr_reader :path, :array

  def initialize(path)
    @path = path
    @array = []
  end

  def files
    @array = Dir.entries(@path).grep(/mp3/)
  end

  def import
    files.each {|f| Song.create_from_filename(f)}
  end

end
