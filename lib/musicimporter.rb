class MusicImporter
  
  attr_accessor :path
  @@files = []

  def initialize(path)
    @path = path 
  end
  
  def files 
    path = @path 
    files = Dir.entries(path)
    files = files.select {|item| item.include?(".mp3")}
    @@files = files
  end
  
  def import
    #I think the problem is with this method. It is not changing the files to song objects. 
    files = @@files
    imported = []
    files.each {|song| imported << Song.create_from_filename(song)}
  end 
end 