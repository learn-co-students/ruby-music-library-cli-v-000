class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    self.path = path
  end

  def files
    @files = Dir.glob(("#{@path}/**/*.mp3"))
    @files.collect {|f| File.basename(f)}
  end

  def import
    files.each { |file| Song.create_from_filename(file)}
  end

end
