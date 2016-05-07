class Artist
extend Concerns::Findable

attr_accessor :name, :artist
@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def add_song(song)
  if @songs.detect {|x| x == song}
  else
  @songs << song
end
  if song.artist == self
  else
  song.artist = self
end
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

def genres

collection_genres = @songs.collect do |song|
song.genre
end
collection_genres.uniq
end


end