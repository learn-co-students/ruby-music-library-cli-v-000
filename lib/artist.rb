class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    @@all << artist
    artist
  end
  
  def add_song(song)
      if song.artist == nil
        song.artist = self
        @songs << song
      end   
  end
  
  def genres
    @genres = []
    self.songs.each do |song|
      @genres << song.genre
    end    
    @genres.uniq
  end
  
  extend Concerns::Findable
end