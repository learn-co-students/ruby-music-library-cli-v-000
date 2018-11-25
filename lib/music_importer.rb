class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
  def files
    Dir[path + "/*"].collect{|file| file[/3s\/(.+3)/, 1]}
  end
  
  def import
    files.each{|file| Song.create_from_filename(file)}
  end
end