require_relative './findable_module.rb'

class Genre
  extend Concerns::Findable
  
   attr_accessor :destroy_all, :create, :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  @@all = []

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
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def artists
    #binding.pry
    all_artists = self.songs.collect{|song| song.artist }
    all_artists.uniq
  end

end