class MusicImporter\

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir["#{self.path}/*mp3"].each{|file| files << file.split("/").last}
    files
  end

  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end

end
