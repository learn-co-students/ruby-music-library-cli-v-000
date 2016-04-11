class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
  end
  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end
  def artist=(artist)
    if self.artist != artist
      @artist = artist
      artist.add_song(self)
    end
  end
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  def self.find_by_name(name)
    @@all.collect do |song|
      song.name == name
      song
    end.shift
  end
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
end