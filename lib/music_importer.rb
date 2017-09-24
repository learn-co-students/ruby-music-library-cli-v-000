class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path).select! {|file| file.match(/.mp3\z/)}
  end

  def import
    files.each {|song| Song.create_from_filename(song)}
  end
end