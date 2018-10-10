
class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
   def files
    @files = Dir.glob("#{@path}/*.mp3")
    @files.collect do |file|
      file.gsub("#{path}/", "")
    end
  end
  
  
end
