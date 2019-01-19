class Artist 
  attr_accessor :name, :songs, :artist, :genres 
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
    
    def self.create(artist_name)
      artist_created = Artist.new(artist_name)
      artist_created.save 
      artist_created
    end
    
    def add_song(song)
     song.artist = self unless song.artist
     @songs << song unless songs.include?(song)
    end
  
end