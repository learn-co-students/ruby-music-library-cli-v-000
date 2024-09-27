class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  #loads all mp3 files from path
  #normalizes filename to just mp3 filename with no path
  def files
    @file_array = [] 
    Dir.foreach(@path) do |item|
      next if item == '.' or item == '..'
      @file_array << item
    end
    @file_array
  end
  
  def import
    files.each {|file| Song.create_from_filename(file)}
  end
  
end