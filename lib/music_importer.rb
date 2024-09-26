class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select{|file| file.include?(".mp3")}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end
