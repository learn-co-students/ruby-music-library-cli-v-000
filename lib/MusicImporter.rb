require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def path
    @path
  end

  def files
    files = Dir.glob("#{path}/*.mp3").collect do
      |file| file.gsub("#{path}/","")
    end
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
