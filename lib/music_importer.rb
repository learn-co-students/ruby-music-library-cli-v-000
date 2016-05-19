class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    directory = Dir.entries(@path)
    directory.delete(".")
    directory.delete("..")
    directory
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end