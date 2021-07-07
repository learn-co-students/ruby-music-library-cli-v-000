class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    files = Dir.glob("#{self.path}/*.mp3")
    files.collect do |filename|
      filename.split("#{self.path}/")[1]
    end
  end

  def import
  self.files.each do |some_filename|
    Song.create_from_filename(some_filename)
    end
  end
end
