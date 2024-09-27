require 'pry'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
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

  def songs
    @songs
  end

  def artists
    artists = songs.collect {|song| song.artist}
    artists.uniq!
    artists
  end
end