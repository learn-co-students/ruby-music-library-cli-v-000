class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    rtn = []
    Dir.glob(self.path.strip + '/*.mp3') do |file|
      file_parts = file.split("/")
      rtn << file_parts[file_parts.size - 1].strip
    end

    rtn
  end

  def import
    files_ = self.files
    puts files_
    files_.each do |e|
      Song.create_from_filename(e)
    end
  end
end
