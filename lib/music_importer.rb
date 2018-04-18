class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    rtn = []
    Dir.glob(self.path.strip + '/*.mp3') do |file|
      rtn << file
    end
    rtn
  end
end
