require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_item = self.new(name)
    new_item.save
    new_item
  end

  def save
    self.class.all << self
  end

  def artists
    artists = []
    self.songs.each do |song|
      if !artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists
  end

end
