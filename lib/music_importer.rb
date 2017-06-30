class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
      files = Dir.glob("#{path}/*.mp3").collect { |file| file.gsub("#{path}/","")}
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end
end
