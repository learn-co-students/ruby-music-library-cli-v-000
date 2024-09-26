class Genre 
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    self.new(name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end
  
  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.genre = self if !song.genre
  end
  
  def artists 
    @songs.collect { |s| s.artist }.uniq 
  end

end