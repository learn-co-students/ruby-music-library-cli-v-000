class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end
  
  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.genre = self if song.genre == nil
  end
  
  def artists
    @songs.collect{|song| song.artist}.uniq
  end
end
