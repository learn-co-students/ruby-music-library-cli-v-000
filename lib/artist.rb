require 'pry'

 class Artist
   extend Concerns::Findable

   attr_accessor :name, :songs

   @@all = []

   def initialize(name)
     @name = name
     @songs = []
   end

   def self.all
     @@all
   end

   def save
     @@all << self
   end

   def self.destroy_all
     @@all.clear
   end

   def self.create(name)
     artist = Artist.new(name)
     artist.save
     artist
   end

   def songs
     @songs
   end

   def add_song(song)
     if !song.artist
       song.artist = self
     end
     if !@songs.include?(song)
       @songs << song
     end
   end

   def genres
    #  binding.pry
     genres = []
     self.songs.collect {|song| genres << song.genre}
     genres.uniq
   end



 end
