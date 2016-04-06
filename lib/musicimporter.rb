class MusicImporter
  attr_accessor :path, :songs
  def initialize(path="./db/mp3")
    @path=path
  end
  def files
    @filenames = Dir.entries(@path).select {|f| f.include?(".mp3")}
  end
  def import
    self.files.collect do |file|
      Song.create_from_filename(file)
    end
  end
end
