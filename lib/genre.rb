require 'pry'

class Genre

  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = Genre.new(name)
    # binding.pry
    new_genre.save
    new_genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def add_song(song)
    @songs.include?(song) ? (puts 'Song already in collection.') : @songs << song
    song.genre == self ? nil : song.genre = self
    @songs
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end

end
