require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    files = Dir.entries(@path).delete_if{|file| file.length < 4}
  end

  def import
    files.each{|song| Song.create_from_filename(song)}
  end
end
