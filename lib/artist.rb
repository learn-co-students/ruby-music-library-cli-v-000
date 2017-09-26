class Artist
 extend Concerns::Findable

 attr_accessor :name

 @@all = []

 def initialize(name)
   @name = name
   @songs = []
 end

 def songs
    @songs
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


 def add_song(song)
   if  song.artist == nil
       song.artist = self
   end
   if @songs.include?(song) == false
        @songs << song
   end
 end

 def genres
   genres_array = []
   @songs.collect do |song|
     genres_array << song.genre
   end
   genres_array.uniq
 end




end
