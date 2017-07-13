class Artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  attr_accessor :name, :songs

  def save
    @@all << self
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    !self.songs.include?(song)
      self.songs << song
    end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
  end
end
