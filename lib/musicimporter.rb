class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(self.path).reject{ |file| !file.include?(".mp3") }
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
