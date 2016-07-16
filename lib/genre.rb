require_relative '../concerns/findable.rb'

class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genre=(genre)
    @genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if songs.include?(song)
      nil
      else
      song.genre = self
      self.songs << song
    end
  end

  def artists
    songs.collect { |song| song.artist }.uniq
  end
  
end