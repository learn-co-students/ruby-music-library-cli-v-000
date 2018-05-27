class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = Dir.entries(@path)
    @files.delete_if {|file| file == "." || file == ".."}
  end
  
  def import
    self.files.each do |file|
      song = Song.create_from_filename(file)
    end
  end
  
end