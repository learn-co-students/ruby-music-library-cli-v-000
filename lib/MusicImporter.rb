class MusicImporter

  attr_accessor :song

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    Dir.entries(self.path).select {|file| file[/\.mp3$/]}
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end
