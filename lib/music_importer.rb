class MusicImporter 
  attr_accessor :path, :file
  
  def initialize(path)
    @path = path
  end 
  
  def files
    data = Dir.entries(path)
    data.delete_if{ |x| x == "." || x == ".." }
  end 
  
  def import 
    files.map do |file|
      Song.create_from_filename(file)
    end
  end 
end 