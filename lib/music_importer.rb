class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.foreach(@path).select do |file|
      file.include?(".mp3")
    end
  end

  def import
    files.map do |create|
      Song.create_from_filename(create)
    end
  end
end
