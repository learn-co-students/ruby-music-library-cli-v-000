
class MusicImporter
  attr_accessor :path, :files

  def initialize(file)
    @path = file
    @files = []
  end

  def files
    Dir.entries(@path).each do |file|
      unless file == "." || file == ".."
        @files << file
      end
    end
    @files
  end

  def import
    files.each do |file|
      file = Song.create_from_filename(file)
    end
  end

end
