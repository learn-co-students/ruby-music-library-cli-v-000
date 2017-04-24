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
<<<<<<< HEAD
    files.each { |filename| Song.create_from_filename(filename)}
=======
    files.each { |filename| Song.new_from_filename(filename) }
>>>>>>> f32922c522b50c58ac0210697679ac27a199c493
  end

end
