require "pry"

class MusicImporter
  
  attr_accessor :path

  def initialize path
    @path = path
  end

  def files
    files = Dir.entries(@path)
    2.times do 
      files.shift
    end
    files
  end


end