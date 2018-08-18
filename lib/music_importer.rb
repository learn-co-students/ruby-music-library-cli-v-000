require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3").collect do |file|
      file.split("/")[-1]
    end
  end

  def import
    files.each {|filename|Song.create_from_filename(filename)}
  end

end
