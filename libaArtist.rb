class Artist
attr_accessor :name
@@all = []

 def initialize(name)
   @name = name
   @songs=[]
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
   new_artist = Artist.new(name)
   new_artist.save
   new_artist
 end

 def songs
   @songs
 end

 def add_song(song)
   if not song.artist
     song.artist = self
     @songs << song
   end
 end

 def genres
   @songs.collect{|song|
     song.genre
   }
 end

end
