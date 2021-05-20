class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = [ ]

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist
  end

  def songs
    Song.all.select{|s|s.artist == self}
  end

  def genres
    self.songs.collect{|s|s.genre}.uniq
  end
end
