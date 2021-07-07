require 'pry'

class Genre
    extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def songs
    @songs
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
    new_genre = Genre.new(name)
  end

  def add_song(song)
    @songs << song
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

end
