class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = Dir.entries(@path)
    @files.delete(".")
    @files.delete("..")
    @files
  end
  
  def import
    files.each{|item| Song.create_from_filename(item)}
  end
end