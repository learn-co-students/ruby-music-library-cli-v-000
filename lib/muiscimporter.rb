require 'pry'
class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if {|file| file == "." || file == ".."}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
