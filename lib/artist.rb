class Artist

attr_accessor :name, :songs

@@all =[]

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

def self.create(artist_name)
  artist = Artist.new(artist_name)
  artist.save
  artist
end

end
