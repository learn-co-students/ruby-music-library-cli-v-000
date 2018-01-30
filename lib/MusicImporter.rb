class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{path}/*.mp3"].collect do |x|
      File.basename(x)
    end
  end

  def import
    files.each do |x|
      Song.create_from_filename(x)
    end
  end


end