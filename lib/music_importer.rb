class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    path = Dir["#{@path}/*"]
    path.collect {|file| File.basename(file)}
  end
  
  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
  
end