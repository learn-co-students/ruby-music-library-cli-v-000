class Artist 
  extend Concerns::Findable 
  
attr_accessor :name 
@@all = []

  def initialize(name) 
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end 
  
  def self.destroy_all
   @@all.clear
 end
 
  def save 
    self.class.all << self 
  end
  
  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end
  
  def songs
    @songs 
  end
  
   def genres
    self.songs.collect{|song| song.genre}.uniq
  end
  
    def add_song(song)
      @songs << song unless songs.include?(song)
      if song.artist == nil
        song.artist = self
    end
  end
end
