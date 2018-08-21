class MusicImporter 
  
  def initialize(path)
    @path = path
  end
  
   def files 
    files_array = Dir[@path + "/*.mp3"]
    files_array.collect do |file|
       file.split("/")[-1]
    end
  end
  
  def import
    new_files = self.files
    new_files.each do |filename|
    Song.new_by_filename(filename)
    end
  end
  
end