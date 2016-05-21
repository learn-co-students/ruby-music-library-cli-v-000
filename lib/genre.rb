require 'pry'

class Genre
  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
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
    Genre.new(name)
  end

  def artists
    array =[]
    self.songs.each do |song_object|
      array << song_object.artist unless array.detect{|artist_object| artist_object.name == song_object.artist.name} 
    end
    array
  end

end