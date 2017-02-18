require 'pry'

class MusicImporter

  @@filesnames = []

  attr_accessor :path

  def initialize(path)
    @path = path

    # binding.pry
    # @@all << @path
  end

  def files
    # binding.pry
    @files = Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/", "")}.sort
    # binding.pry
    # @@filenames << @files
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end

end
