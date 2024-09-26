class MusicImporter
  attr_accessor :path, :filenames

  def initialize(path)
    @path = path
    @filename_lib = []
  end

  def files
    @filenames = Dir.entries(@path).delete_if{|w| w.size<3}
  end

  def import
    self.files
    @filenames.each do |filename|
      song = Song.new_from_filename(filename)
      @filename_lib << song
    end
  end

end
