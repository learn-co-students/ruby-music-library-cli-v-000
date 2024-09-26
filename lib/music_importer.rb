class MusicImporter

  attr_accessor :path, :filenames

  def initialize(path)
    @path = path
    @filenames = []
  end

  def files
    Dir["#{path}/**/*.mp3"].each do |filename|
      @filenames << filename[filename.rindex("/") + 1..-1]
    end
    @filenames
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end
