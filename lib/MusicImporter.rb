class MusicImporter
  


  attr_accessor :songs,:path

  

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.foreach(@path).select {|x| File.file?("#{@path}/#{x}")}
    @files
  end



  def import 

    self.files.each do |file_name| 
      new_song = Song.create_from_filename(file_name)
      
    end

  end
     
  




end