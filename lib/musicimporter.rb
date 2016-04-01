class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select { |file| file.end_with?(".mp3") }
  end

  def self.new_from_filename(filename)
    # song = self.create(filename)
    song = filename.chomp!(".mp3")
    # song = filename.split(" - ")
    name = song.split(" - ")[1]
    artist = song.split(" - ")[0]
    genre = song.split(" - ")[2]
    new_song = Song.new(name)
    new_song.artist = artist
    new_song.genre = genre
    new_song
  end
end
