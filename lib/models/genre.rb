require 'pry'

class Genre
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
  
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
  
  def artists
    artists_array = self.songs.collect do |song|
      song.artist
    end
    artists_array.uniq
  end
  
end