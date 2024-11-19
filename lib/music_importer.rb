require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path)
    files.delete(".")
    files.delete("..")
    files
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end

end
