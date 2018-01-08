class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[self.path + "/*.mp3"].collect { |file| file.split(/\//)[-1] }
  end
end
