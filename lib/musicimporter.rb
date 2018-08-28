class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end 
  
  def files(path)
    Dir.entries(@path).select {|f| !File.directory? f}
  end 
  
end 