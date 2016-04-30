require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self if song.genre == nil
  end

  def name=(name)
    @name = name
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

  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end

  def to_s
    self.name
  end

  def artists
    self.songs.collect { |s| s.artist }.uniq
  end
end
