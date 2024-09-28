class MusicImporter

  attr_accessor :path, :song, :artist, :genre

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*.mp3")
    files.each do |file|
      file.slice!("#{path}/")
    end
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end

end
