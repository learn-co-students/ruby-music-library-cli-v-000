class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    self.path = path
    self.files = []
    Dir["#{@path}/*.mp3"].each {|file| @files << File.basename(file)}
  end

  def import
    @files.each {|filename| Song.create_from_filename(filename)}
  end
end
