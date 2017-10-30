class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select do |x|
      x.end_with?(".mp3")
    end
  end

  def import
    files.map do |x|
      Song.create_from_filename(x)
    end
  end
end
