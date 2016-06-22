class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path)
    mp3s = []

    files.each do |filename|
      mp3s << filename if  filename.end_with?(".mp3")
    end
    mp3s
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end

end
