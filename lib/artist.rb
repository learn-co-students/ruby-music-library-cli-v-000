class Artist
  
  extend Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
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
  
  def self.create(artist)
    a = Artist.new(artist)
    a.save
    a
  end
  
  def songs 
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end
  
  def genres
    songs.collect{|song| song.genre}.uniq
  end
  
end