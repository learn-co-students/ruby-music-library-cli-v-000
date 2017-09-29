class MusicImporter
  attr_accessor :songs, :path
  def initialize(path)
    @path = path
    @files = [] 
  end
  def files
    Dir.foreach(@path) do |file|
      if file != "." && file !=".."
        @files << file
      end
    end
    @files
  end
  def import
    self.files.each do |file|
      song = Song.create_from_filename(file)
    end
  end

end
