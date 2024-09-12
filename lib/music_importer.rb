class MusicImporter
  attr_reader :path 
  
  def initialize(path)
    @path = path 
  end
  
  def files
    file_name_array = Dir[@path + "/*.mp3"]
    file_name_array.collect {|f| f.split("/")[-1]}
  end
  
  def import 
    self.files.each do |filename|
      Song.create_from_filename(filename)  
    end
  end
  
end