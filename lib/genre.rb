require_relative './song.rb'
require_relative './artist.rb'
require_relative '../concerns/findable.rb'

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
    artist_list = []
    self.songs.each { |song| artist_list << song.artist }
    artist_list.uniq
  end
end