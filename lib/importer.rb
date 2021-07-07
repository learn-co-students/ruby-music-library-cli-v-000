class MusicImporter
  attr_accessor :files, :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = Dir.entries(path).keep_if{|f| f.end_with?(".mp3")}
  end
  
  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end
end