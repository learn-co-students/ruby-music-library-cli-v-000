class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(path).select do |f|
      f.include?("mp3")
    end
  end

  def import
    files.each do |filename|
      Song.new_from_filename(filename)
    end
  end
end
