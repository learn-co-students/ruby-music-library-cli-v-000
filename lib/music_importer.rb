class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{path}/*"]
    files.map { |file| file.split("/").pop  }
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end

end
