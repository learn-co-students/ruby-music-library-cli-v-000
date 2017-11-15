class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, a = false, g = false)
    @name = name
    self.save
    self.artist = a if a
    self.genre = g if g
  end

  def self.all
    @@all
  end

  def save
    @@all << self unless @@all.include?(self) #leaving out for now
  end

  def self.create(name)
    song = self.new(name)
  end

  def self.destroy_all
    self.all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    a = Artist.find_or_create_by_name(split[0])
    s = split[1]
    g = Genre.find_or_create_by_name(split[2].sub(".mp3", ""))

    self.new(s, a, g)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
