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
   if song.instance_variable_defined?(:@artist) == false
       song.artist = self
   elsif @songs.include?(song) == false
       @songs << song
   end
 end

 def genres
   self.songs.collect do |song|
     song.genre
   end
 end
end
