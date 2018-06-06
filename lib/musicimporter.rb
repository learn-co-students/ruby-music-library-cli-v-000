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

  def import
    self.files
    @files.each {|file_name| Song.create_from_filename(file_name)}
  end
end
