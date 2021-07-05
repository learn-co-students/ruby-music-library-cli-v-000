class Genre
@@all = []
extend Concerns::Findable
attr_accessor :name

def initialize(name)
  @name = name
  @songs = []
end



def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  @@all << self
end

def self.create(name)
  new_object = self.new(name)
  new_object.save
  return new_object
end

def songs
@songs
end

def artists
output = []
  self.songs.each do |song|
    if !output.include?(song.artist)
      output << song.artist
    end
  end
return output
end





end
