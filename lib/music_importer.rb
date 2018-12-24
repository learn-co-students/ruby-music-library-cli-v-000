class MusicImporter 
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files 
    x = Dir.glob("#{@path}/*.mp3")
    x.collect do |e|
      e.gsub("./spec/fixtures/mp3s/", "") 
    end
  end 
end 