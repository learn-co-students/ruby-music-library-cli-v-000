class Song 

attr_accessor :name 

@@all = []

def initialize(name)
  @name=name 
end 

def save
  @@all << self 
end 

def self.all
  @@all
end 

def self.destroy_all
  @@all.clear 
end 

def self.create(name)
    new_song = Song.new(name)
    @@all << new_song
    new_song 
end 

end 

