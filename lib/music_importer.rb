class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).select do |file|
      file if file.include?(".mp3")
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
