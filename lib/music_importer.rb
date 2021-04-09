class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
    Dir.chdir(@path) do
    files = Dir.glob("*.mp3")
    files.each {|file| @files << file}
    end
  end

  def files
    @files
  end

  def import
    @files.each do |file|
      song = Song.create_from_filename(file)
      song
    end
  end
end
