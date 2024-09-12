require 'pry'
class MusicImporter
  attr_accessor :path
  @@all = []

  def initialize(filepath)
    @path = filepath
  end

  def path
    @path
  end

  def files
    Dir.entries(@path).reject{|f| f == "." || f == ".."}
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end
