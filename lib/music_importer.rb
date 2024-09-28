class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = []
    Dir.foreach(@path) {|file| @files << file if file.end_with?(".mp3")}
    @files
  end

  def import
    @library = files.collect {|filename| Song.create_from_filename(filename)}
  end
end
