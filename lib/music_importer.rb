class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir.entries(@path)
    @files.uniq!
    @files.delete(".")
    @files.delete("..")
    @files
  end

  def import
    self.files
    @files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end
end
