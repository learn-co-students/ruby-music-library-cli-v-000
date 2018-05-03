class MusicImporter
  
  attr_reader :path 
  
  def initialize(path)
    @path = path
  end
  
  def files 
    files = Dir[self.path + '/*.mp3']
    files.collect do |file|
      file.sub(self.path + '/', '')
    end
  end

  def import 
    self.files.collect do |filename|
      Song.create_from_filename(filename)
    end
  end
  
end
