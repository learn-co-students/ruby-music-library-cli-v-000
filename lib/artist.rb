require 'pry'
require_relative '../lib/concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

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
    self
  end

  def self.create(name)
    Artist.new(name).save
  end

  def songs=(song)
    @songs << song
  end

  def add_song(song)
    self.songs = song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    unique_genre = []

    @songs.each do |i|
      unique_genre << i.genre unless unique_genre.include?(i.genre)
      end
      unique_genre
  end
end
