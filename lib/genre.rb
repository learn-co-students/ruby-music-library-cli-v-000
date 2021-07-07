class Genre
    extend Concerns::Findable

@@all = []
  
attr_accessor :name 

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

def add_songs(song)
  @songs << song
end

def songs 
  @songs 
end

def save 
  @@all << self 
end 
  
def self.create(name)
  genreinst = Genre.new(name)
  genreinst.save
  genreinst 
end 

def artists 
  @songs.each do |song|
    if !@songsarray.include?(song.artist)
      @songsarray << song.artist
    end
  end
    @songsarray
end   
  
  
end