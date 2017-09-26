

class Genre
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

 def artists
   artists_array = []
     @songs.collect do |song|
       artists_array << song.artist
     end
   artists_array.uniq
  end






end
