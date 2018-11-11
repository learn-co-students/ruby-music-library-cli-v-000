class MusicImporter 
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end 
  
  def files
    data = Dir.entries(path)
    data.delete_if{ |x| x == "." || x == ".." }
  end 
  
  def self.import 
    #instantiates new song object 
  end 
end 