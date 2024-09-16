class MusicImporter

  attr_accessor :path, :filenames

  def initialize(path)
    self.path = path
    self.filenames = []
  end

  def files
    self.filenames = Dir["#{path}/*.mp3"]
    filenames.map {|file| file.slice! "#{path}/"}
    self.filenames
    # binding.pry
  end

  def import
    files
    # binding.pry
    Song.create_from_filename(filenames)
  end
end
