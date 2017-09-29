require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/", "")}
  end

  def import
    files = Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/", "")}
    files.each{|f| Song.create_from_filename(f)}
  end

end