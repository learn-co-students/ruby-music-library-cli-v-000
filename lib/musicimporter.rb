class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(path) { |file| files << file if file.include?(".mp3") }
    files
  end
end
