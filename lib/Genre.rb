class Genre
  
  extend Concerns::Findable
  
attr_accessor :name
attr_reader :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
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
  genre = new(name)
  genre.save
  genre
end

def add_song(song)
  if song.genre != self
    song.genre = self
  end
  
  if !@songs.include?(song)
    @songs << song
  end
end

def artists
  songs.map(&:artist).uniq
end

end