require_relative 'concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all =[]

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    if !(self.songs.include?(song))
      self.songs << song
    end
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end


end
