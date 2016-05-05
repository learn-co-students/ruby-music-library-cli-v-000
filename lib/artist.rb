class Artist

attr_accessor :name, :artist
@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def add_song(song)
  @songs << song
  song.artist = self
end

def songs
  @songs
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
  artist = self.new(name)
  artist.save
  artist
end


end