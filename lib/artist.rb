class Artist
attr_accessor :name
attr_reader :songs
@@all = []
extend Concerns::Findable

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
  @@all.clear
end 

def self.create(name)
  artist = Artist.new(name)
  artist.save 
  artist
end

def add_song(song) 
    if @songs.include?(song) == false 
      if song.artist == nil
   @songs << song
   song.artist = self
   end
 end
end 

def genres 
  @songs.collect {|song| song.genre}.uniq 
end 

end 