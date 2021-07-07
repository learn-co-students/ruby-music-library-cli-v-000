class MusicImporter 
  attr_reader :path
  
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


  # def files
  #   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  # end
  
  # def import
  #   files.each{ |f| Song.create_from_filename(f) }
  # end