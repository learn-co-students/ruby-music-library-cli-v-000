require 'pry'

class MusicImporter
  
attr_accessor :path

  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end
  
  def import
    self.files.map { |f| Song.new_by_filename(f) }
  end
  
end
