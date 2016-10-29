class Artist
  extend  Concerns::Findable
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def genres
  genres=self.songs.collect do |song| song.genre end
  genres.uniq
  end

  def self.all
  @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
end

def add_song(song)
e  = self.songs.include?(song)
if e == false
  self.songs << song
end
if song.artist == nil
  song.artist = self
end
end
end
