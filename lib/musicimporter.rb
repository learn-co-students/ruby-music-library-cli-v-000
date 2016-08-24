
require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    dir = @path
    files = Dir.entries(dir).select do |file|
      file.to_s.include?("mp3")
    end 
    files
    
  end

  def import
    list = self.files
    list.each do |filename| 
      Song.create_from_filename(filename)
    end
  end

end