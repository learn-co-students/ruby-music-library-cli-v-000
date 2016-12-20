class MusicImporter
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
  end 
  
  def files
    self.files =  Dir.entries(@path).reject! do |file_name|
      file_name !~ /\.mp3$/ 
    end
  end
  
    
end