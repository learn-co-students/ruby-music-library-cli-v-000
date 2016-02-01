require 'pry'
class Genre

  attr_accessor :name, :songs

  @@all = []

  extend Concerns::Findable

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
    genre = self.new(name)
    self.all << genre 
    genre 
  end

  def add_song(song)
    if !self.songs.any? {|e| e.name == song.name  }
      self.songs << song 
      song.genre = self
    end
    self.songs.uniq!
  end

  def artists
    artist = self.songs.collect do |song|
      song.artist
    end
    artist.uniq
  end

end