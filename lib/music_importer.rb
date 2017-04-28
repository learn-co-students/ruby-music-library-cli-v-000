class MusicImporter
  attr_accessor :path,:filepaths

  def initialize(path)
    self.path = path
  end

  def files
    self.filepaths = Dir.glob("#{self.path}/*.mp3")
    self.filepaths.each do |filepath|
      filepath.slice! "#{self.path}/"
    end
    self.filepaths
  end

  def import
    self.files.each do |filepath|
      Song.create_from_filename(filepath)
    end
  end

end
