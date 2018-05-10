class MusicImporter 
  
  attr_accessor :path 
  
  def initialize(file_path)
    @path = file_path
  end 
  
  def path 
    @path 
  end 
  
  def files 
    mp3_files = Dir["#{@path}/*.mp3"]
    
    mp3_files.map do |file_name|
      if !File.directory? file_name
         file_name.split("/").pop
      end 
    end 
    
  end 
  
  def import 
    self.files.each{ |file_name|
      Song.create_from_filename(file_name)
    }
  end 
  
end 