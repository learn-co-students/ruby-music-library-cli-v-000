class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    entries = Dir.entries(self.path)
    mp3_files = entries.select do |entry|
      File.extname(entry) == ".mp3"
    end
    @files = mp3_files
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
