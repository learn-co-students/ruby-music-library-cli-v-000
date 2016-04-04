class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    
    Dir.entries(path).select do |file| 
      
       file.end_with?(".mp3")
       
        end
  end
end