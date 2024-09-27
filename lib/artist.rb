class Artist 
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save 
    new_artist
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    
    unless @songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    genres = []
    @songs.each {|song| genres << song.genre unless genres.include?(song.genre)}
    genres.uniq
  end
  
  def self.all 
    @@all.uniq 
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def save 
    @@all << self unless @@all.include?(self)
  end
end

