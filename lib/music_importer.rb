class MusicImporter

  attr_accessor :path, :musiclibrarycontroller

  def initialize(path = "./db/*mp3")
    @path = path
  end

  def files
    Dir.glob("./#{path}/*.mp3").collect{|file| file.gsub("./#{path}/", '')}.sort
 end

 def import
   files.each do |file|
     Song.create_from_filename(file)
   end
end
end
