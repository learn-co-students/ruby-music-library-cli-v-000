class Artist
   extend Concerns::Findable
   attr_accessor :name, :songs
   
   @@all = []
   
   def save
    @@all << self
   end
   
   def self.all
    @@all
   end
   
   def initialize(name)
    @name = name
    @songs = []
   end
   
   def self.create(name)
    new(name).tap {|i| i.save}
   end
  
   def self.destroy_all
    self.all.clear
   end
   
   def add_song(song)
     songs.include?(song) || self.songs << song 
     song.artist ||= self
   end
   
   def genres
    self.songs.collect { |i| i.genre }.uniq
   end
 end