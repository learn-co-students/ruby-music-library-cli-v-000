class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("./#{path}/*.mp3").collect{|file| file.gsub("./#{path}/", '')}
 end

 # def import
 #   files.each do |file|
 #     Song.new_by_filename(file)
 #   end
#end


end
