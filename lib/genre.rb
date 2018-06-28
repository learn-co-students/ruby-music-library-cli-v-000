require 'pry'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !song.genre
      song.genre = self
    end

    if ! @songs.detect { |i| i == song }
      @songs << song
    end

  end

  def songs
    @songs
  end

  def artists
    artists = @songs.collect { |song| song.artist }
    artists.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

end
