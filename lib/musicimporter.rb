class MusicImporter 
  attr_accessor :path 
  def initialize(path)
    @path = path
  end 
  
  def files
    Dir.glob("*.mp3", base: "#{@path}")
  end 
  
  def import 
    files.each {|filename| Song.create_from_filename(filename)}
  end 
end 