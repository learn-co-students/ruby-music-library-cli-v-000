require_relative './concerns.rb'

require 'pry'

class Artist

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
    Artist.new(name)
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end

    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    genre_array = @songs.collect{|song| song.genre}
    genre_array.uniq
  end

end
