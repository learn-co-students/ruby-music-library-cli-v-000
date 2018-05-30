class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist

  def initialize(name)
    @name = name
    @@all = []
    @@artist<< self
  
  
  def add_Song()
    self.Artist << Artist
    artist.song = self
  end
  
  def self.all 
   @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.find_by_name(artist_name)
    self.all.detect{|artist| artist.name == artist_name}
  end

  def self.find_or_create_by_name(artist_name)
    self.find_by_name(artist_name) || self.new(artist_name)
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
end
end