class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).grep(/.mp3/)
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
