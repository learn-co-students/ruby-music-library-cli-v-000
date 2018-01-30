class MusicImporter
  attr_accessor :path
  attr_reader :import

  def initialize(path)
    @path = path
    self.import
  end

  def files
    Dir.entries(self.path).select{|f| f.end_with?(".mp3")}
  end

  def import
    files.collect{|s| Song.create_from_filename(s)}
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1].strip
    artist = filename.split(" - ")[0].strip
    genre = filename.split(" - ")[2].chomp(".mp3").strip

    song = Song.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end