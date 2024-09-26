class MusicImporter

  attr_reader :path
  
  def initialize(path)
    @path = path    
  end

  def files
    Dir.chdir(self.path) {|path| Dir.glob("*.mp3")}
  end

  def import
    files = self.files
    files.each {|filename| Song.create_from_filename(filename)}
  end

end