class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.new(self.path).each do |file|
      if file.include?(".mp3")
        files << file
      end
    end
    files
  end

  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end

end
