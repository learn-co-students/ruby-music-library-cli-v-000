class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir(@path) do
      @files = Dir.glob("*.mp3")
    end
    @files
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
