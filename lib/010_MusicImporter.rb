require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir.glob("#{path}/*.mp3") # get the .mp3 files
    @files.map! do |file|
      file = file.sub(/#{path}\//, '') # remove file path/
    end
  end

  def import
    files
    @files.each do |file|
      Song.new_from_filename(file) # send the filenames to the Song class
    end
  end

end
