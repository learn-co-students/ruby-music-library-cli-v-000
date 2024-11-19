class MusicImporter
  attr_writer :path, :files

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    Dir["#{self.path}/*.mp3"].collect do |file|
      file.match(/[^\/]*$/)[0]
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
