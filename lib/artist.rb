class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs
  
    @@all = []
    
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new(name).save
    self
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    self.class.all << self
  end
  
  
  def add_song(song)
    songs << song  unless @songs.include?(song)
    song.artist = self unless song.artist
  end
  
  def genres 
    @songs.collect {|song| song.genre}.uniq
  end
  
end