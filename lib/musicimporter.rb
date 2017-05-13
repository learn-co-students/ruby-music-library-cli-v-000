class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*.mp3"].map{|file| file.split("/").last}
  end

  def import
    self.files.each {|i| Song.create_from_filename(i)}
  end

end
