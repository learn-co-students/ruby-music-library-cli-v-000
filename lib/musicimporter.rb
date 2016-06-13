class MusicImporter
  attr_reader :path, :library
  
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
    files.each {|file| Song.new_from_filename(file) }
  end
end    
