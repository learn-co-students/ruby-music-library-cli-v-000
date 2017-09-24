class MusicImporter
  attr_accessor :path, :filenames

  def initialize(path)
    @path = path
    @filenames = []
  end

  def files
    filenames = Dir["#{@path}/*"]
    filenames.each do |filename|
      normalize = filename.split("/mp3s/")
      @filenames << normalize[1]
    end
    @filenames
  end

  def import
    files
    @filenames.each do |filename|
      Song.new_from_filename(filename)
    end
  end

end
