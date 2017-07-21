class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect {|file| file.gsub("#{path}/", "")}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

end
