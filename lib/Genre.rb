require 'pry'
class Genre

  extend Concerns::Findable

  attr_writer :name
  attr_reader :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
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

  def self.create(name)
    genre = new(name)
  end

  def add_song(song)
    if !@songs.include?(song)
      self.songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    artists = []
    @songs.collect {|song| artists << song.artist}
    artists.uniq
  end
#binding.pry
end
