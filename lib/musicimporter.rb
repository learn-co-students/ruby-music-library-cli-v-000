class MusicImporter
  
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).delete_if { |n|
      !n.include?("mp3")  
    }
  end
  
  def import
    self.files.each { |n|
      Song.create_from_filename(n) }
  end
  
end