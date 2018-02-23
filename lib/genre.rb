class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    self.save
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
    Genre.new(name).tap do |genre|
      genre.save
    end
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    self.songs << song if self.songs.include?(song) == false
  end
  
  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
end