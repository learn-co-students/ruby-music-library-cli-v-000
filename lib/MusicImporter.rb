
class MusicImporter
  attr_accessor :path,:song, :genre, :artist

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).delete_if {|f| !f.include?("mp3")}
  end

  def import
    self.files.each do |filename|
    song = Song.create_from_filename(filename)
    end
  end

end
