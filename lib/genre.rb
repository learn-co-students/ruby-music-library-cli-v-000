require_relative './concerns/findable.rb'
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
  
  def save
    @@all << self
  end
  
  def self.create(name)
    created_genre = self.new(name)
    created_genre.save
    created_genre
  end
  
  def songs
    @songs
  end
  
  def artists
    a = songs.collect do |song|
      song.artist
    end
    a.uniq
  end
end