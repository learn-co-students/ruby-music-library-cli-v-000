class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3").collect { |path| path.gsub("#{@path}/","") }
  end

  def import
    self.files.each { |file| Song.create_from_filename(file) }
  end

end
