class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*.mp3"].collect do |file|
      file.match(/[A-Z]\w*[^.]*(..)*/)[0]
    end
  end

  def import
    self.files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end

end
