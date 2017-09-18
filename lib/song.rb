
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end
  def self.all
    @@all.dup.freeze
  end
  def save
    @@all << self
    self
  end
  def self.destroy_all
    @@all.clear
  end
  def artist=(name)
    @artist = name unless @artist != nil
    name.add_song(self) unless name.songs.include?(self)
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  def self.new_from_filename(filename)
    artist, file_song, genre = filename.split(" - ")
    song = self.new(file_song)
    song.artist = artist
    song
    binding.pry
  end

end
