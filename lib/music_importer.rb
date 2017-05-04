class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def import
    files.each { |f| Song.create_from_filename(f) }
  end

  def files
    Dir.glob("#{path}/*.mp3").collect { |file| file.gsub("#{path}/", "") }
  end
end
