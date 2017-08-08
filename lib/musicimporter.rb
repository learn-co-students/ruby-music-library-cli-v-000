require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select do |file|
      file != ".." && file != "."
    end
  end

  def import
    song_list = files
    song_list.each {|song| Song.create_from_filename(song)}
  end
end
