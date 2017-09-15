require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    files = Dir.glob(@path + "/*")
    files = files.collect do |file|
      file.split("/").last
    end
  end

  def import
    @files = files
    @files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
