require 'pry'

class Genre
    attr_accessor :name, :song, :songs, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def artists
    @@all.collect{|genre|
      genre.songs.collect{|song| song.artist
      }
    }.flatten.uniq

  end
  

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
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

end