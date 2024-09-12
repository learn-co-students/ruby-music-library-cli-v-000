class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    normalized = []
    files = Dir["#{@path}/*.mp3"]
    files.each do |filename|
      normalized << File.basename(filename)
    end
    normalized
  end

  #imports the files into the library by creating songs from a filename
  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
