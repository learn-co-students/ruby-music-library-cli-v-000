# Genre Class
#
#
require_relative "./concerns/findable.rb"

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

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
  end
  
  def songs 
    @songs
  end

  def artists
    artists = @songs.collect {|song| song.artist}
    artists.uniq
  end
  





end
