class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    dir = Dir.open(@path)
    dir.each do |file_name|
      @files << file_name if (file_name.size > 2)
    end
    @files
  end

end
