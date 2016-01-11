class Song
  attr_accessor :name, :genre, :artist

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist=nil, genre=nil)
    new_entry = self.new(name, artist)
    new_entry.save
    new_entry
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist if artist
    @genre = genre if genre
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

end