class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).reject {|song_file| !song_file.end_with?(".mp3")}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
