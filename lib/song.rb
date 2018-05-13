class Song

attr_accessor :name, :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist if artist
  self.genre = genre if genre
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
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
  song = self.new(name)
  @@all << song
  song
end

def self.find_by_name(name)
    @@all.detect {|a| a.name == name}
  end

def self.find_or_create_by_name(name)
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
else
  self.create(name)
end
end

end
