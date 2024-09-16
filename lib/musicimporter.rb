class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
    @files = []
  end
  
  def files
    Dir.foreach(self.path) do |item|
     next if item == '.' or item == '..'
     @files << item
    end
    @files
  end
  
  def import
    files.collect {|file| Song.create_from_filename(file) }
  end
end    
