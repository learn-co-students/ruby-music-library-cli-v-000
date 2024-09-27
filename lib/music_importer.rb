class MusicImporter
  attr_accessor :path, :song, :artist, :genre

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.glob("#{@path}/*.mp3").each do |filename|
      file = filename.split("/")[4]
      files << file
    end
    return files
  end

  def import
    self.files.each do |filename|
      song = Song.create_from_filename(filename)
    end
  end
end
