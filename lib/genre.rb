require_relative '../concerns/findable.rb'

class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

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
    @@genres << self
  end

  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end

  # def add_song(song)
  #   song.genre = self if song.genre.nil?
  #   @songs.detect { |name| @songs << song if name != song }
  # end

  def artists
    @songs.collect { |name| name.artist}.uniq
  end
end
