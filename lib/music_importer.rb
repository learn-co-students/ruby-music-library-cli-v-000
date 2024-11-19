require 'pry'
class MusicImporter 
  attr_reader :path
  
  def initialize(path)
    @path = path 
  end 
  
  def files
    @files = []
      Dir.glob("#{@path}/**/*.mp3").each{|a| @files << a.gsub("#{@path}/","")}
    @files
  end 
  
  def import
    self.files.each{|a| Song.create_from_filename(a)}
  end 
end 
