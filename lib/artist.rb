require 'pry'
class Artist

  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

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
  #Tmmorrow work on this
  def self.create(name)
    artist = self.new(name)
    self.all << artist
    artist
  end

  def add_song(song)
    if !self.songs.any? {|e| e.name == song.name  }
      self.songs << song 
      song.artist = self
    end
    self.songs.uniq!
  end

  def genres 
    genres = self.songs.collect do |song|
       song.genre 
    end
    genres.uniq
  end


end