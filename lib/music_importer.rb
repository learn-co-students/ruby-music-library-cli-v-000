class MusicImporter

  def initialize(path)
    @path = path
  end 

  def path
    @path 
  end

  def files
    result = []
    Dir.foreach(path) do |f| 
      unless f == "." || f == ".." 
      result << f  
  end
  end 
      result  
  end

  def import 
    files.each do |import|
      Song.create_from_filename(import)
    end 
  end   
  
end 