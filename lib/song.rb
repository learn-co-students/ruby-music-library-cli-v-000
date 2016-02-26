class Song
  attr_accessor :name
  @@all = []
  def initialize(name, artist = "", genre = "")
    self.name = name
    self.artist = artist
    self.genre = genre
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
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  def artist
    @artist
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self) if artist != ""
  end
  def genre
    @genre
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self if genre != "" && !genre.songs.include?(self)
  end
  def self.find_by_name(name)
    self.all.find { |song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found == nil
      self.create(name)
    else
      found
    end
  end
end