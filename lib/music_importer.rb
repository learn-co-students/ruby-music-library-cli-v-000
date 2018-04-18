class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    rtn = []
    Dir.glob(self.path.strip + '/*.mp3') do |file|
      file_parts = file.split("/")
      rtn << file_parts[file_parts.size - 1]
    end
    rtn
  end
end
