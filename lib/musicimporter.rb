class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def path
    Dir.glob(@path).join()
  end

  def files
  library = []
  Dir.entries(path).each do |filename|
    library << filename
  end
  library.reject {|x| x == "." || x == ".."}
end

def import
  files.each do |file|
    Song.create_from_filename(file)
  end
end

end
