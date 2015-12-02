require 'pry'
require_relative '../concerns/findable.rb'

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre_new)
    new_genre = self.new(genre_new)
    new_genre.save
    new_genre
  end

  def artists
    songs.map { |h| h.artist }.uniq 
  end

end