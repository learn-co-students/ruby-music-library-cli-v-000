require_relative './song.rb'

require_relative 'concerns/concerns.rb'

class Genre
  attr_accessor :name, :songs
  
  extend Concerns::Findable

  @@all=[]

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    if !songs.include?(song)
         songs << song
    end
    self
  end

  def artists
    artists = songs.collect {|song| song.artist }
    artists.uniq
  end

end