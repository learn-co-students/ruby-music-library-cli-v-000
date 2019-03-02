class MusicImporter
  
  attr_accessor :path

  def initialize(path)
    @path = path 
  end
  
  def files
=begin 
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f|
    binding.pry 
    f.gsub("#{path}/", "") }
=end 

    path = @path 
    files = Dir.entries(path)
    files = files.select {|item| item.include?(".mp3")}
    @files = files

  end
  
  def import 
    imported = []
    files.each {|song| imported << Song.create_from_filename(song)}
  end
end 