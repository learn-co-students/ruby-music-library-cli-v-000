class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  def songs
    @songs
  end
  def add_song(song)
      self.songs << song unless self.songs.include?(song)
      song.artist = self unless song.artist
  end
  def genres
    self.songs.collect{|song| song.genre }.uniq
  end
end
