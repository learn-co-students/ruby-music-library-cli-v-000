require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path).find_all {|file| file.include?(".mp3")}
files
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end