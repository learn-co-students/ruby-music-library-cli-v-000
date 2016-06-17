class Song
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist = nil, genre = nil)
    song.save
    song
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  #def self.find_by_name(name)
  #  self.all.detect {|song| song.name == name}
  #end

  #def self.find_or_create_by_name(name)
  #  if self.all.detect {|song| song.name == name}
  #    self.find_by_name(name)
  #  else
  #    self.create(name)
  #  end
  #end

  def self.destroy_all
    self.all.clear
  end
end
