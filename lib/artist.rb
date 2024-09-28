class Artist
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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_instance = new(name)
    new_instance.save
    new_instance
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if !song.artist
  end

  def songs
    @songs
  end
  
  def genres
    @songs.collect{|song| song.genre}.uniq
  end
end
