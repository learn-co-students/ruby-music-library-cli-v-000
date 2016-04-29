class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []

    Dir.entries(@path).each do |file|
      @files << file if file.include?(".mp3")
    end
  end

  def files
    @files
  end

  def import
    @files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
