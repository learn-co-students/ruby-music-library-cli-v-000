class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    mp3_files = Dir.glob(File.join(@path, "*.mp3"))
    mp3_files.map {|f| File.basename(f)}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

end
