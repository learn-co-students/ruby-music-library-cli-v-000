class Artist
  attr_accessor :name, :song, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    song.artist ||= self
    self.songs << song unless self.songs.include?(song)
  end

  def songs
    @songs
  end
end
