class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir.entries(path).reject {|entry| entry.split(" - ").size != 3}
  end

  def import
    self.files.each {|file|
      Song.create_from_filename(file)
    }
  end
  
end