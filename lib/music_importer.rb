require 'pry'
class MusicImporter 
  @@library = []
  attr_accessor :path 
  
  def initialize(path) 
    @path = path 
    @all_paths = Dir.entries(path) 
    @all_paths.delete_if do |info|
      info == "." || info == ".."
    end 
  end 
  
  def files
    @all_paths
  end 
  
  def import 
    self.files.each do |file|
      @@library << Song.create_from_filename(file)
    end 
  end
  
  def self.library
    @@library
  end 
  
end 