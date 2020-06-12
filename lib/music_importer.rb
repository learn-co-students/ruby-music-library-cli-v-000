class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = Dir.glob("#{path}/*.mp3")
    files.collect { |filename| filename.gsub("#{path}/", "") }
  end

  def import
    files.collect { |filename| Song.create_from_filename(filename) }
  end


end
