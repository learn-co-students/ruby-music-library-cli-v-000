require 'pry'
require_relative './song.rb'
require_relative './genre.rb'
require_relative '../concerns/findable.rb'

class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if @songs.include?(song)
      @songs
    else
      @songs << song
      song.artist = self
    end
  end

  def genres
    genre_list = []
    self.songs.each { |song| genre_list << song.genre }
    genre_list.uniq
  end
end