class Song_Artist
   
def initialize(name)
  @name = name
end

def self.all
  @@all
end

def self.destroy_all
  all.clear
  
end

def save
  @@all << self
end

end