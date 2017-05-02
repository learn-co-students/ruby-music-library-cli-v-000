require_relative '../config/environment.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

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

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end
end
