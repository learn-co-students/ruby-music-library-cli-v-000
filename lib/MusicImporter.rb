require 'pry'

class MusicImporter

  include Concerns::Findable

  attr_writer :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    array = []
    x = Dir.open(path)
    x.each {|y| array << y}
    array = array[2,5]
  end

  def import
    files.each {|song| Song.create_from_filename(song)}
  end

end
