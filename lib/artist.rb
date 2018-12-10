class Artist
  extend Concerns::Findable
  

attr_accessor :name

@@all = []

def initialize(name)
  @name = name
  @@all << self
  @songs = []
end

def genres
  @songs.collect do |song|
    song.genre
  end.uniq
end

def songs
  @songs
end

def add_song(song)
  @songs << song if !self.songs.include?(song)
  if song.artist.nil?
    song.artist = self
end
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
  created_artist = Artist.new(name)
  created_artist.save
  created_artist
end


end
