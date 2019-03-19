class MusicImporter

attr_reader :path   
  
  def initialize(path)
    @path = path 
  end
  
  def files
    files = []
    
    Dir.glob("#{path}/*.mp3").collect do |file|
      files << file.gsub("#{path}/", "")
    end
    files
  end
  
  def import 
    files.each do |files| Song.create_from_filename(files)
  end
end
  
end