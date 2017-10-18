class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{path}/*.mp3"].collect {|f| File.basename f}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
