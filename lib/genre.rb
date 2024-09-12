require_relative './concerns/findable.rb'
class Genre
  extend Concerns::Findable

  @@genres = []
  
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@genres
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    self.all.last
  end

  def save
    Genre.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    @songs.map{|song| song.artist}.uniq
  end

end