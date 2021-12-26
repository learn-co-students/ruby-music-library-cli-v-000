class Genre
    extend Concerns::Findable
  attr_accessor :name, :artist, :songs
@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def save
self.class.all << self
end

def self.all
@@all
end

def to_s
   self.name
 end

def self.destroy_all
@@all.clear
end

def self.create(name)
  new(name).tap{|s| s.save}
end


def artists
  self.songs.collect{|s| s.artist}.uniq
end

end
