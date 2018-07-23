
class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.chdir(@path) {|path| Dir.glob("*.mp3")}
  end
  
  def self.import(files)
    files.each  do |f| 
      song = Song.new(f.partition(' - ')[0])
      song.artist = f.partition(' - ')[1]
      song.genre = f.partition(' - ')[2]
    end
      
  end
  
end
    