class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name
  
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
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end 
  
  def songs 
    @songs
  end 
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist != self
  end
  
  def genres
     genres = @songs.collect do |song, genre|
       song.genre
     end
     genres.uniq
  end
end