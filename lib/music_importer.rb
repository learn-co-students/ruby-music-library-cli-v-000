class MusicImporter
  attr_reader :path
  def initialize(path)
    @path = path
  end
  def files
    Dir["#{@path}/*.mp3"].map{|file|
    file.split("/").last}
  end
  def import
    self.files.each {|file|
      Song.create_from_filename(file)
    }
  end
end
