require_relative './concerns/findable.rb'

class Genre
  extend Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do |genre|
      @@all << genre
    end
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def self.list_genres
    self.all.each {|genre| puts "#{genre.name}"}
  end

  def list_genre_songs # the similar method for this in Artist could be modularized 
    self.songs.each {|song| puts "#{song.song_attributes}"} # iterate over the genre's song array and put for each song the song attributes
  end


end
