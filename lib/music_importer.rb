class MusicImporter
  
  attr_accessor :path, :files
  
  def initialize(path)
   @path = path
  end
  
  
  def files 
   Dir.chdir(@path) do |mp3|
     Dir.glob("*.mp3")
   end
  end
  
  def import 
    self.files.each do |filename|
    song = Song.create_from_filename(filename)
  end
  end
  
end