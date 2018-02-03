class MusicImporter
  attr_reader :path
  
  def initialize(path="./db/mp3s")
    @path = path
  end
  
  def import
    files.collect{|file| Song.create_from_filename(file)}
  end
  
  def files
    Dir.chdir(@path){Dir.glob("*.mp3")}
  end
  
end