# lib/genre.rb
class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @songs = []
    @name = name
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
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def self.alpha_genres
    @@alpha_genres = @@all.sort {|a, b| a.name <=> b.name}
  end

end
