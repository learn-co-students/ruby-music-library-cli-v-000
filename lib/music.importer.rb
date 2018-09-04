class MusicImporter
  
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{self.path}/**/*.mp3"].map {|file| file.gsub("#{self.path}/","")}.sort
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end
