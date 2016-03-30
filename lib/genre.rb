require_relative 'concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

end