class MusicImporter

  @@all = []

  def initialize(path)
    @path = path

  end

  def path
    @path
  end

  def files
    songs = []
    Dir.foreach(@path) { |song| songs << song}
    songs.delete_if { |x| x == ".." || x == "."}
  end

  def import
    files.each { |song| Song.create_from_filename(song)}
  end
end
