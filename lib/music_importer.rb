require 'pry'

class MusicImporter
  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    @@array = Dir.glob("#{@path}/*.mp3")
    @@array = @@array.collect do |file|
      file.split("/")[-1]
    end
    @@array
  end

  def import
    @@array.each {|filename|
      Song.create_from_filename(filename)
    }
  end

end
