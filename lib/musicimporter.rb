class MusicImporter
  attr_accessor :path, :songs
  def initialize(path)
    @path=path
  end
  def files
    @filenames = Dir.entries(@path).select {|f| f.include?(".mp3")}
  end
  def import
    self.files.collect do |file|
      file.create_from_filename
    end
  end
end
