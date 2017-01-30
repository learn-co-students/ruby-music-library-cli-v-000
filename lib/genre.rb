class Genre
  extend Concerns::Findable
attr_accessor :name, :songs 
@@all = []

def initialize(name)
  @name = name
  @songs = [] 
end# of initialize


def self.all
  @@all
end# of self.all


def artists
  @songs.collect {|song| song.artist}.uniq
end# of artists


def self.destroy_all
  self.all.clear 
end# of self.destroy_all


def save
  @@all << self
end# of save 


def self.create(name)
  self.new(name).save 
  self 
end# of self.create

end# of Artist