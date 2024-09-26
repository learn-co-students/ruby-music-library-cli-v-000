class Artist

  extend Concerns::Findable

  attr_accessor :name

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
  new_artist = self.new(name)
  new_artist.save
  new_artist
end

def add_song(song)
 song.artist = self unless song.artist
 songs << song unless songs.include?(song)
    # tells new song that it belongs to an artist
end

def songs
@songs
end

def self.destroy_all
  @@all = []
end

def genres
  songs.collect{ |s| s.genre }.uniq
  
end


end
