class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select{|file| file.include?(".mp3")}
  end

  def import
    self.files.map do |file|
      Song.create_from_filename(file)
    end
  end
end
