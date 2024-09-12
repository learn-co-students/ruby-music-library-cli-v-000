require 'pry'
class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre)
    self.new(genre).tap {|genre| genre.save}
  end

  def songs
    @songs
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end
end
