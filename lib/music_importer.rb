class MusicImporter
  
  attr_reader :path

  def initialize(path)
    @path = path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |x| x.gsub("#{path}/", "") }
  end
  
  def import
    files.each{ |x| Song.create_from_filename(x) }
  end
end
