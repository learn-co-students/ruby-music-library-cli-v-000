require "spec_helper"

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
      new = Genre.new(name)
      @@all << new
      new
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end

end

# rspec spec/003_genre_basics_spec.rb
# rspec spec/005_songs_and_genres_spec.rb
