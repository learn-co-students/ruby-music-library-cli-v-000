
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select do |file_name|
      file_name.include? "mp3"
    end
    @files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
