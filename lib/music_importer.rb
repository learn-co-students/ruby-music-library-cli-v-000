
class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.chdir(@path) {|path| Dir.glob("*.mp3")}
  end
  
  def import
    self.files.each { |fn| Song.create_from_filename(fn) }
  end
  
end
    