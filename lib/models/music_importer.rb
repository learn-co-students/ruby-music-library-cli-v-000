require 'pry'

class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    imp_files = Dir.glob("#{path}/*")
    imp_files.map do |file| 
      file.gsub("#{path}/", "")
    end
  end
  
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
  
end