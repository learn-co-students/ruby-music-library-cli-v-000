class MusicImporter
  attr_accessor :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    Dir.entries(@path).select!{ |file| file.end_with?("mp3") }
  end
  
  def import
    files.each{ |f| Song.create_from_filename(f) }
  end
  
end