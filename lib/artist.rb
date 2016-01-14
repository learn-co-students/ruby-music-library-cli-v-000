require_relative '../Concerns/Concerns::Findable.rb'

class Artist 

 extend Concerns::Findable 
attr_accessor :name, :song, :artist, :genre  
 
 @@all = []

 
  
 
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

 def self.create(artist)
   
   new_artist = Artist.new(artist)
   new_artist.save 
   new_artist

 end
  
 def add_song(song)
   if song.artist == nil 
   song.artist = self 
   end  
   
   if @songs.detect {|i| i.name == song.name} != song 
     @songs << song 
   end 
 
 end 

 def songs 
  @songs 
 end 

 def genres 
   @songs.collect {|song|song.genre}.uniq 

 end 
 
end 