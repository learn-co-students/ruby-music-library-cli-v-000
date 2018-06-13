class Genre
extend Concerns::Findable
attr_accessor :name, :artist, :genre, :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def self.all
  @@all
end

def save
  @@all << self
end

def self.create(name)
  genre = self.new(name)
genre.name = name
genre.save
genre
end

def self.destroy_all
  @@all.clear
end

def songs
  @songs
end

def artists
  @songs.collect{|s| s.artist}.uniq
end

end
