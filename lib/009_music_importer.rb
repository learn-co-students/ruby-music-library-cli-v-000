class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[@path+"/*.mp3"].collect do |file|
      file.split("/").last
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
