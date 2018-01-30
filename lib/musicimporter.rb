class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[self.path + "/*.mp3"].collect { |file| file.split(/\//)[-1] }
  end

  def import
    self.files.each { |filename| Song.create_from_filename(filename) }
  end
end
