class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(@path) {|filename| files << filename if filename.include?(".mp3")}
    files
  end

  def import
    files.each { |filename| Song.create_from_filename(filename)}    
  end

end
