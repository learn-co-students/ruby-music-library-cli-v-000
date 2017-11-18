class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect { |file| file.gsub("#{path}/", "") }
  end

  def import
    files.collect { |file| Song.create_from_filename(file) }
  end
end
