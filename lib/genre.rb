class Genre
@@all = []
attr_accessor :name
extend Concerns::Findable


def initialize(name)
  @name = name
  @@all << self
  @songs = []
end

def self.all
  @@all
end

def save
  @@all << self
end

def self.destroy_all
  @@all.clear
end

def self.create(song)
  self.new(song)
end

def songs
  @songs
end

def artists
  @artists
end

def artists
  self.songs.collect{|song| song.artist}.uniq
end


###
end
