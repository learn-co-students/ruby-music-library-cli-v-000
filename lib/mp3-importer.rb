class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*{mp3}").map { |d| d.split("/").last}
  end

  def import
    Song.create_from_filename(self.files)
  end

end
