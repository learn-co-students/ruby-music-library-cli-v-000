require 'pry'

class MusicImporter

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def self.all
    @@all
  end



  def files
    array = Dir["#{@path}/*.mp3"]
    array.each do |file|
      file.gsub!(/.\/.*.\//, '')
    end
    array
  end

  def import
    files.each do |file|
    Song.create_from_filename(file)
    end
  end

end
