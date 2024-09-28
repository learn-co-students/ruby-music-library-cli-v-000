class MusicImporter
  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
  def files
    Dir.chdir(path) do |path|
      Dir.glob("*.mp3")
    end
  end
  
  def import
    songs = files.collect do |filename|
      Song.create_from_filename(filename)
    end
  end
end