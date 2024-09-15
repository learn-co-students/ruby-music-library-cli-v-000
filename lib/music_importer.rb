class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    filepaths = Dir.glob(File.join(self.path, "*mp3*"))
    filenames = []
    filepaths.each do |filepath|
      file_data = filepath.split("/")
      filename = file_data[-1]
      filenames << filename
    end
    filenames
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
