class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

   @@all = []

   def initialize(name)
     @name = name
     self.save
     @songs = []
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

   def add_song(song)
    if !(self.songs.include?(song))
         self.songs << song
    end
    if song.artist != self
       song.artist = self
     end
  end

  def genres
    genres = []
    self.songs.each do |song|
         if !(genres.include?(song.genre))
           genres << song.genre
         end
    end
    return genres
  end

end
