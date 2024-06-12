class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + "/*.mp3"].collect do |mp3|
      mp3.split("/").last
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
