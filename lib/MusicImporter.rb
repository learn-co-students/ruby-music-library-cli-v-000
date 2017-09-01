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
    lol = []
    x = Dir.open(path)
    x.each do |file|
      lol << file
      if file != "." && file != ".."
        array << file
      end
    end
   array
  end

  def import
    files.each {|song| Song.create_from_filename(song)}
  end

end
