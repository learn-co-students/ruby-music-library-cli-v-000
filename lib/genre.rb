

class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
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
  
  def self.create(name)
    self.new(name).tap { |s| s.save }
  end
  
  def save
  @@all << self
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.genre == nil 
      song.genre = self
    end
    unless @songs.include?(song)
      @songs << song 
    end
  end
  
  def artists
    @songs.collect {|song| song.artist}.uniq
  end
end