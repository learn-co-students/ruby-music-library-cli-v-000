class MusicImporter

  attr_reader :path, :songs

  def initialize(path)
    @path = path
    @storage = []
  end

  def files
    Dir.chdir(path) do
      Dir.glob("*.mp3").each do |song|
          @storage << song
      end
    end
  end

  def import
    files
    @storage.each do |x|      
      Song.create_from_filename(x)
    end
  end
end