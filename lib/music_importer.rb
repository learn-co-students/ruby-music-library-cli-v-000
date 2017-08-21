class MusicImporter
  attr_reader :path
  # @@files = [] not sure if this is needed

  def initialize(path)
    @path = path
    # @@files << self  not sure if this is needed
  end

  def files
    x = Dir.entries(path)
    x.delete(".")
    x.delete("..")
    x
  end

  def import
    self.files.each {
    |file| Song.create_from_filename(file)
  }
  end

end
