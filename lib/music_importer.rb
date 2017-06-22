class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
  end

  def files
    @files = []
    Dir.foreach(@path) do |file|
      if file.end_with?(".mp3")
         @files << file
      end
    end
    @files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
