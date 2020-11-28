class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs 
  
  
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
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist
  end 
  
  def songs 
    #Song.all.select {|song| song.artist == self}
    @songs
  end 
  
  def add_song(song)
    if self.songs.include?(song) == false
      @songs << song
      song.artist = self if song.artist == nil
    end 
    
  end 
  
  def genres
    #Genre.all.collect {|genre| genre if genre.artist == self}.uniq
    @songs.collect {|song| song.genre}.uniq 
  end 
  
end 