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
    @songs << song unless song.artist
    song.artist = self unless song.artist
    
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
      
    
end