class MusicImporter

  def initialize(file_path)
    @path = file_path
  end

  def path
    @path
  end

  def files
    files = Dir.glob("#{@path}/*.mp3")
    files.map { |f| File.basename(f) }
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end
end
