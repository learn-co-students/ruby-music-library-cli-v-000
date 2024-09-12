class MusicImporter
  
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = []
    Dir.new(self.path).each do |file|
      files << file if file.length > 4
    end
    files
  end
def import
    files.each do |files|
      Song.create_from_filename(files)
    end
  end

  end