class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    dir = Dir.new(path)
    song_arr = []
    dir.each do |filename|
        song_arr << filename if filename != "." && filename != ".."
    end
    song_arr
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
     end
  end

end
