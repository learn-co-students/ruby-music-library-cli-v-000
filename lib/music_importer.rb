class MusicImporter
  attr_accessor :path, :files, :songs

  def initialize(path)
    @path = path
    @songs = []
  end

  def files
    @files = Dir.entries(@path).grep(/.mp3/)
  end

  def import
    self.files.each do |file|
      self.songs << Song.create_from_filename(file)
    end
  end
end
