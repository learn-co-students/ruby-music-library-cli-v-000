class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{path}/*.mp3"]
    files.map { |f| File.basename(f) }
  end

  def import
    files.each { |f| Song.create_from_filename(f) }
  end
end
