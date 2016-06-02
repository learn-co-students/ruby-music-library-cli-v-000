class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(@path).grep(/.mp3/)
  end
  
  def import
    files.each do |each_file|
      Song.new_from_filename(each_file)
    end
  end
  
end