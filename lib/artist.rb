class Artist
   extend Concerns::Findable
   
   attr_accessor :name, :songs
   
   @@all = []
   
   def initialize(name)
      @name = name
      @songs = []
      save 
   end
   
   def self.destroy_all
      @@all.clear 
   end
   
   def self.all
      @@all 
   end
   
   def self.create(name)
      Artist.new(name)
   end
   
   def save
      @@all << self 
   end

   def add_song(song)
      # binding.pry
      song.artist = self if song.artist == nil
      @songs << song if !@songs.include?(song)
   end
   
   def genres
      a = @songs.map {|song| song.genre}
      a.uniq
   end
    
end