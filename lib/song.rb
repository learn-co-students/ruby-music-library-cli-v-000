class Song
  attr_accessor :name, :genre, :artist

  @@all = []
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find{|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create(name) if self.find_by_name(name) == nil
    self.find_by_name(name)
  end

  def self.new_from_filename(filename)
    s = filename.chomp(".mp3").split(" - ")
    a = Artist.find_or_create_by_name(s[0])
    g = Genre.find_or_create_by_name(s[2])
    self.new(s[1], a, g)
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).tap{|i| i.save}
  end
end
