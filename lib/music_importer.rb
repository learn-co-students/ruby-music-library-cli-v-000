
class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    self.path = path
  end 
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect { |filename| filename.sub("#{path}/", '') }
  end 
  
  def import
    files.each { |file| Song.create_from_filename(file) }
  end
end