require_relative '../config/environment'

class Genre
extend Concerns::Findable
attr_accessor :name
@@all = []

 def initialize(name)
   @name = name
   @songs =[]
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
   new_genre = Genre.new(name)
   new_genre.save
   new_genre
 end

 def songs
   @songs
 end

 def songs=(song)
   if !@songs.include?(song)
     @songs << song
   end
 end

 def artists
  genres_artists =  @songs.collect{|song|song.artist}
  genres_artists = genres_artists.uniq
 end

end
