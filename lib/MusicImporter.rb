class MusicImporter
  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def import
    self.files.each{ |filename| Song.create_from_filename(filename)}
  end

  def files
    Dir.entries(path).select {|file| file.include?(".mp3")}
  end
end
