class MusicImporter
  
attr_accessor :path

  def initialize(path)
    @path = path
  end
  
  def files
    Dir.chdir(@path) do |path|
    Dir.glob("*.mp3")
    end
  end
  
  def import
      files.each {|filename| Song.create_from_filename(filename)}
  end
  
 
  
  
end
