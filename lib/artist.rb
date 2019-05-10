class Artist 
  @@all = []
  attr_accessor :name, :songs 
  extend Concerns::Findable
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
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save 
    artist
  end
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song 
      song.artist = self if song.artist.nil? 
    end
  end
  
  def genres 
    @songs.collect {|song| song.genre}.uniq 
  end
end