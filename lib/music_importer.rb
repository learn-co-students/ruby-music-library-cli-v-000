require 'pry'

class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    path = Dir["#{@path}/*"]
    path.collect {|file| File.basename(file)}
  end
  
  def import
    
  end
  
end


importer = MusicImporter.new('db/mp3s')
importer.files