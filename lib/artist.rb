require 'pry'
require_relative './song.rb'

require_relative 'concerns/concerns.rb'

class Artist
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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !songs.include?(song)
         songs << song
    end
    self
  end

  def genres
    genres = songs.collect {|song| song.genre }
    genres.uniq
  end

end