class MusicImporter

  attr_accessor :path, :files

  def initialize(filepath)
    @path = filepath
    files
  end

  def path
    @path
  end

  def files
    Dir.chdir(@path) do
      @files = Dir.glob("*.mp3")
    end
  end

  def import
    @files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
