class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    list_of_filenames = Dir.entries(@path)
    list_of_filenames.delete(".")
    list_of_filenames.delete("..")
    list_of_filenames
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
