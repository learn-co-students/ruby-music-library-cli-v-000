class Genre
  extend Concerns::Findable
  attr_accessor :name, :genre, :songs, :artist
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
    genre = Genre.new(name)
    genre.save
    genre 
  end
  
  def add_song(song) 
    song.genre = self unless song.genre == self
    @songs << song unless @songs.find{|a| a == song} 
  end 
  
  def artists
   artist_collect = @songs.collect{|a| a.artist}
   artist_collect.uniq 
  end 
end 