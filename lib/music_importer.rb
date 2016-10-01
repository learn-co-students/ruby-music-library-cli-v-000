class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
    @files = Dir.entries(path)
    @files.delete(".")
    @files.delete("..")
  end

  def files
   @files
  end

  def import
    @files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
