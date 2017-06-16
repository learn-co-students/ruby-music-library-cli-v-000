class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select{|f| !File.directory? f}.sort
  end

  def import
    self.files
    @files.each do |filename|
      song = Song.create_from_filename(filename)
      song.artist.add_song(song)
    end
  end

end
