class Artist
extend Concerns::Findable


attr_accessor :name, :songs


@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def self.all
@@all
end

def save
  self.class.all << self
end

def self.destroy_all
  self.all.clear
end

def self.create(name)
  new_artist = self.new(name)
  new_artist.save
  new_artist
end

def add_song(song)
  # if song.artist == nil
  song.artist = self unless song.artist == self
  @songs << song unless self.songs.include?(song)
end

def songs
  @songs
end

def genres
  genres = []
  @songs.collect do |song|
    genres << song.genre
  end
  genres.uniq
end

end
