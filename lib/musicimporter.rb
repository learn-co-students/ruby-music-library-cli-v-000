require_relative "song.rb"

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    list = Dir["#{@path}/**/*.mp3"]
    a = []
    list.each do |song|
      song_mod = song.split("/")
      a << song_mod.last
    end
    a
  end

  def import
    list = files
    #binding.pry
    Song.create_from_filename(list)
  end

end