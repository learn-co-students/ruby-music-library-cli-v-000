class Song

attr_accessor :name, :artist

@@all = []

def initialize(name, artist = nil)
  @name = name
  @artist = artist
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
  @@all << self.new(name)
  self
end

def artist
  Artist.add_song
end

end
