class MusicImporter
  attr_accessor :path
  
  def initialize(filepath)
    @path = filepath
  end
  
  def files
    Dir.entries(@path)
  end
  
  def import
    self.files. each do |file|
      Song.create_from_filename(file)
    end
  end
  
end