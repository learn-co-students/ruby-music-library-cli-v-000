class MusicImporter
  attr_accessor :path

  def initialize(path)
      @path = path
  end

  def files
  Dir.entries(@path)[2..-1] 
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

end