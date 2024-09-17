require 'pry'
class MusicImporter 
  
  attr_accessor :path, :files
  
  def initialize(path) 
    @path = path
  end 
  
  def files
    current_dir = Dir.getwd
    Dir.chdir(@path)
    @files = Dir.glob("*.mp3")
    Dir.chdir(current_dir)
    @files
     
  end
  
  def import 
    files.each do |file|
      Song.create_from_filename(file)
    end 
  end 
end 