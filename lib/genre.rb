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
  genre = self.new(name)
  genre.save 
  genre 
end# of self.create


def self.find_by_name(name)
  self.all.find {|song| song.name == name}
end# of self.find_by_name


def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
      self.create(name)
  else 
    self.find_by_name(name) 
  end# of if 
end# of self.find_or_create_by_name


end# of Artist