class MusicImporter
  attr_accessor :path

  def initialize(filepath)
    self.path = filepath
  end

  def files
    files = Dir.entries(self.path)
    files.select { |file| file.match(/mp3/)  }
  end

  def import
    files = self.files
    files.each { |song| Song.create_from_filename(song) }
  end
end
