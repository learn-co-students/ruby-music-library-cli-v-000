
class MusicImporter

  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
  end

  def files
    self.files = Dir.entries(@path).reject! do |file_name|
      file_name !~ /\.mp3$/
    end
  end

  def import
    self.files.collect do |file|
      Song.create_from_filename(file)
    end
  end

end
