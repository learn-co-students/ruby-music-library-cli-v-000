require_relative './concerns/findable.rb'

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

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    self.songs.collect {|s| s.artist}.uniq
  end

end
