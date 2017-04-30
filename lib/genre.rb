require_relative '../concerns/findable.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    self.songs << song unless self.songs.include?(song)
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def print
    puts self.name
  end

  def self.print_all
    self.all.each do |genre|
      genre.print
    end
  end

  def artists
    unique_artists = []
    self.songs.each do |song|
      unique_artists << song.artist unless unique_artists.include?(song.artist)
    end
    unique_artists
  end
end