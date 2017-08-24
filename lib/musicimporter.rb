class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir.entries(path).select { |file| file.include?(".mp3") }
  end

  def import
    self.files.each do |filename|
    Song.create_from_filename(filename)
    end
  end
end
