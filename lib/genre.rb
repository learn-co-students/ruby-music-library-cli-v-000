require "pry"

class Genre
  attr_accessor :name, :songs
  attr_reader :all
  @@all = []
  extend Concerns::Findable

  def initialize (name)
    @name = name
    @songs = []
  end

  def add_song (song)
    song.genre = self if !song.genre
    songs << song unless songs.include?(song)
  end

  def artists
    songs.collect { | song | song.artist }.uniq
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create (name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

end
