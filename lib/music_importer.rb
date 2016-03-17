class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
    self.load_files
  end
  
  def load_files
    Dir.foreach(self.path) { |file| @files << file if File.extname(file) == ".mp3"}
  end

  def import
    self.files.each { |file| Song.create_from_filename(file) }
  end
end