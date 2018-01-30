class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect { |file| file.split("/").last}
  end

  def import
    self.files.each { |file| Song.create_from_filename(file) }
  end
end
