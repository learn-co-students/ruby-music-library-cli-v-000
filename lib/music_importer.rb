require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path=path
  end

  def files
  music_files=[]
  music_files= Dir[@path+"/*"]
  music_files.map {|name| File.basename name}
  
  end

  def import
  holder=[]
  files.each do |string|
    File.basename(string,".mp3")
    holder<<string
    end
    holder.each do |file|
    Song.create_from_filename(file)
  
  end
  end
end