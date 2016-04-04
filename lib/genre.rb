require_relative '../concerns/findable.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@genres = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@genres
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@genres << self unless @@genres.find { |genre| genre == self }
  end

  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end

  def artists
    @songs.collect { |name| name.artist}.uniq
  end
end
