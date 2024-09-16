class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).grep(/.mp3/)
  end

  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end

end