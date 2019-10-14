class Artist

attr_accessor :name, :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
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
  artist = new(name)
  artist.save
  artist
end

def songs
  @songs
end

end
