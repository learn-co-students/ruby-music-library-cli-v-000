class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
    @files = self.files
  end

  def files
    @files = Dir.entries(@path).sort
    @files.shift(2)
    return @files
  end

  def import
    @files.each do |song_file|
      Song.new_from_filename(song_file)
    end
  end

end
