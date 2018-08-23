class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.new(@path).each do |file|
      if file.length > 3
        files << file
      end
    end
    files
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
