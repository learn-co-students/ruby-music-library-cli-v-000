class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir[path+"/*.mp3"]
    files.map do |info|
      set = info.split("mp3s/")
      set[1]
    end
  end

  def import
    self.files.each do |song|
      Song.new_from_filename(song)
    end
  end

end