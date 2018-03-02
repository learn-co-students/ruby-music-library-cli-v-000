class MusicImporter
  
  attr_accessor :path, :files
  @@data = []

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(@path).each do |file|
       @files << file if file.include?(".mp3")
     end
    @files
  end

  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end

end

