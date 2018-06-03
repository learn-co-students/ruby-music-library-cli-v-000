class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
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
    Artist.new(name).save
  end

  def songs
    self.songs
  end

  def add_song(song)
    if song.artist.class != Artist
      song.artist = self
    end
    unless self.songs.include?(song)
      self.songs << song
    end
  end
end
