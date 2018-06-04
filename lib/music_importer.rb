class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).select {|file| file[/\.mp3$/]}
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
