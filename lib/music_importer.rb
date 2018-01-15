require 'pry'

class MusicImporter

attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    song_list = Dir.glob("#{path}/*.mp3")
    song_list.map {|song| song.split(/\b\//)[3]}
  end

end
