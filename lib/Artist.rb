class Artist
     extend Concerns::Findable
   attr_accessor :name, :genres
   attr_reader :songs
   def initialize(name)
     @name = name
     @songs = []
   end
   @@all = []
   def self.all
     @@all
   end
   def self.destroy_all
     @@all = []
   end
   def save
     @@all << self
   end
   def self.create(name)
   artist = Artist.new(name)
   artist.save
   artist
   end
   def genres
     songs.collect do |song|
       song.genre
     end.uniq
   end
   def add_song(song)
     @songs << song if !@songs.include?(song)
     song.artist = self if song.artist == nil
   end
end
