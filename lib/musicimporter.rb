class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*.mp3"].collect{|file| file.split("/").last}
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
