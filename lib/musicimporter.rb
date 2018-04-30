class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    arr = nil
    Dir.chdir(@path) do |x|
      arr = Dir.glob "*.mp3"
    end
    arr
  end

  def import
   files.map { |filename| Song.create_from_filename(filename) }
  end

end
