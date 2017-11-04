class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path)
    @files.uniq
    @files.delete(".")
    @files.delete("..")
    @files
  end

  def import
    files.each{ |filename| Song.create_from_filename(filename) }
  end
end
