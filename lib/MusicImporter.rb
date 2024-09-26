class MusicImporter
  attr_accessor :path
  @files=[]

  def initialize(path)
    @path = path
  end

  def files
    @files  = Dir.entries(@path).select {|x|
      !File.directory?(x)
      }
    @files
  end

  def import
    self.files.each {|file|
      x = Song.create_from_filename(file)
      }
  end

end
