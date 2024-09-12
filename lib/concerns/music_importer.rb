class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir(@path) {| path | Dir.glob("*.mp3")}
  end

  def import
    self.files.each {|s| Song.create_from_filename(s)}
  end
end
