class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files # ||= will assign value if variable holds nothing
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
  
  def import #uses instance variable @files
    files.each{|f| Song.create_from_filename(f)}
  end
  
end