
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    files = Dir.glob("#{self.path}/**/*.mp3")
    files.map{|file| file.split("/").last}
  end

  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end
end
