# TODO REFACTORE new_from_filename AND create_from_filename
class Song

  attr_accessor :name, :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
    names = filename.split(/ - |.mp3/)
    artist = Artist.find_or_create_by_name(names[0])
    genre = Genre.find_or_create_by_name(names[2])
    Song.new(names[1], artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save unless self.find_by_name(song.name)
    song
  end

end
