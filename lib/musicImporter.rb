class MusicImporter

  def initialize(path)
    @path = path
  end
  attr_accessor :path

  def files
    files = Dir.entries(@path)
    files.select{|file| file.match(/.mp3/)}

  end

  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end
end
