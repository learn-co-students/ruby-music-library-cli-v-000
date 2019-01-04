require "pry"
class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.glob("#{@path}/*.mp3").map {|n| n.gsub("#{@path}/", "")} 
  end
  
  def import 
    files.map{|f| Song.create_from_filename(f)}
  end
  
end