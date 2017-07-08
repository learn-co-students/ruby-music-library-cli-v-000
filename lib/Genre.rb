class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

   @@all = []

   def initialize(name)
     @name = name
     @songs = []
     self.save
   end

   def add_song(song)
    if !(self.songs.include?(song))
         self.songs << song
    end
    if song.genre != self
       song.genre = self
    end
  end

   def songs
     @songs
   end

   def  self.all
     @@all
   end

   def self.destroy_all
     @@all.clear
   end

   def save
     @@all << self
   end

   def self.create(name)
     self.new(name)
   end

   def artists
     artists = []
     self.songs.each do |song|
          if !(artists.include?(song.artist))
            artists << song.artist
          end
     end
     return artists
  end

end
