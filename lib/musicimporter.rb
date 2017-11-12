class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    the_files = []
    Dir.foreach(self.path) {|file| the_files << file if file.end_with?(".mp3")}
    the_files
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end
end
