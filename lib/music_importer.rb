
class MusicImporter
  
  attr_accessor :song, :genre, :artist
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
 def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
  
  def import
    files.each {|f| Song.create_from_filename(f)}
  end
end

