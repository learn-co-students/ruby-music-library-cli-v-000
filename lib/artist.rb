
class Artist 
  @@all = []
  attr_accessor :name, :songs
  
  
  def initialize(name)
    @name = name
    @@all << self 
    @songs = []
  end
  

   def self.all 

    @@all.each do |song|
      puts song.name
    end 
  end

  def self.destroy_all
    @@all.clear 
  end 
  
    def save 
      self.class.all << self
    end 
    
    def self.create(name)
      artist = self.new(name)  
      self.all << artist 
      artist
    end

    def add_song(song)
      @songs << song unless songs.include?(song)
      if song.artist == nil
        song.artist = self
      end
    end
      
  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
    
end
