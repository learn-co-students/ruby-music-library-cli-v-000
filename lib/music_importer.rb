class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    dir = Dir["#{@path}/*.mp3"]
    dir.map {|file| File.basename(file)}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
