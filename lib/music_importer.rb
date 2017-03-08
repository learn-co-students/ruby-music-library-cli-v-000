class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = []
    @files = Dir.glob("#{@path}/*.mp3").collect do |path|
      path.gsub("#{@path}/","")
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
