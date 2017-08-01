class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

    @@all = []

def initialize(name)
  @name = name
  @songs = []
end

def artists
  songs.collect{ |s| s.artist }.uniq
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
  song = new(name)
  song.save
  song
end

end
