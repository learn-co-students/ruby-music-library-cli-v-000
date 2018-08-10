require_relative './concerns_module.rb'
require 'pry'

class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).save
  end

  def artists
    artist_list = []
    song_list = self.songs
    song_list.each do |song|
      if artist_list.include?(song.artist) == false
        artist_list << song.artist
      end
    end
    artist_list
  end
end
