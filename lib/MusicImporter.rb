class MusicImporter
  attr_reader :path
  def initialize(path)
    @path = path
  end 
  def files 
    Dir.entries(@path).delete_if { |file_name| file_name.length < 5 }
  end 
  
  def import
    self.files.collect{ |filename| Song.create_from_filename(filename) }
  end
end 