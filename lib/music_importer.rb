class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
    @files = []
  end

  def files
    files = Dir.glob("#{@path}/*.mp3")
    files.each do |file|
      file = File.basename(file)
      @files << file
    end
    @files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
