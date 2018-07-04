class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    returned = []
    files = Dir["#{@path}/*"]
    files.each { |file|
      returned << file.match(/[^\/]+\z/).to_s
    }
    returned
  end

  def import
    self.files.each { |file|
      Song.create_from_filename(file)
    }
  end

end#endof class
