class MusicImporter
  attr_accessor :path

  # path = './db/mp3s'
  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if do |file|
      file == "." || file == ".."
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
