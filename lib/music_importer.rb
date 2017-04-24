class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @mp3_files = Dir.glob(File.join(@path, "*.mp3"))
    @mp3_files.map { |f| File.basename(f) }
  end

  def import
     files.each { |filename| Song.new_from_filename(filename) }
  end

end
