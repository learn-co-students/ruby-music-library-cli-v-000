class Genre

attr_accessor :name, :songs
@@all = []

def initialize(name)
@name = name
@songs = []
end

def save
@@all << self
end

def self.all
@@all
end

def self.destroy_all
  @@all = []
end

def self.create(name)
  x = Genre.new(name)
  x.save
  x
end
end 
