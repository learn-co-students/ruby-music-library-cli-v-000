class MusicImporter

  attr_accessor :path

  @@files = []

  def initialize(path)
    @path = path
  end

  def files
    @@files = Dir.entries(@path)
    @@files.select {|file| file.match(/.mp3\z/)}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
