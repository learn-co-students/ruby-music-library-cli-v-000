class Artist
  attr_accessor :name, :song

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
end

  def save
    @@all << self
  end

  def add_song(song)
   song.artist = self unless song.artist
   songs << song unless songs.include?(song)
 end

def self.create(name)
  artist = new(name)
  artist.save
  artist
end

  def self.destroy_all
    all.clear
  end
end
