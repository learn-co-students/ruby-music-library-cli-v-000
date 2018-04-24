class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir(@path) do | path |
        Dir.glob("*.mp3")
    end
  end
 
  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
end