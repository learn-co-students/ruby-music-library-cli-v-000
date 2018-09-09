class Song

attr_accessor :name

@@all = []

def initialize(artist_name)
  @name = artist_name
end 

def self.all
  @@all
end 

def.self.destroy_all
  self.all.clear
end 

def save
  self.class.all << self
end 

end 