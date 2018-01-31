
class Artist
attr_accessor :name, :songs
@@all = []
extend Concerns::Findable



def initialize(name)
@name = name
@songs = []
end

def songs
  @songs
end


def self.all
@@all
end

def self.destroy_all
all.clear
end

def save
@@all << self
end

def self.create(name)
artist = new(name)
artist.save
artist
end


def add_song(song)
if song.artist == nil
  song.artist = self
end
if self.songs.include?(song)
else @songs << song
end
end


def genres
@songs.collect {|song| song.genre}.uniq
end

end
