require_relative './concerns/findable'

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
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

  def artists
    @songs.map {|song| song.artist}.uniq
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.genre = self if !song.genre.nil?
    end
  end

end
