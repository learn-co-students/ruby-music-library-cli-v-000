require_relative './concerns.rb'

require 'pry'

class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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
    Genre.new(name)
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    artist_array = @songs.collect{|song| song.artist}
    artist_array.uniq
  end

end
