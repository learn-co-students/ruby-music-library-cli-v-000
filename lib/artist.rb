class Artist 
  extend Concerns::Findable

@@all = [] 

attr_accessor :name, :songs

def initialize(name)
  @name = name
  @songs = []
  @songsarray = []
end

def name 
  @name 
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
  artistint = Artist.new(name)
  if !@@all.include?(name)
    artistint.save
  end
  artistint
end

def add_song(song)
  if song.artist == nil 
    song.artist = self
  end 
  if !songs.include?(song)
    @songs << song
  end 
end

def genres 
  @songs.each do |song|
    if !@songsarray.include?(song.genre)
      @songsarray << song.genre
    end
  end
  @songsarray
end 


end 