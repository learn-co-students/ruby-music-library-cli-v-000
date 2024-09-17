class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect do |file|
     filename = file.split("/")[4]
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
