# require 'pry'
# require_relative './song.rb'
require_relative './concerns/findable.rb'

class Artist
  extend Findable

  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.create(name)
    self.new(name).tap do |artist|
      @@all << artist
    end
  end

  def save
    @@all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song) # add song to the instance's songs array unless the current instance's songs array already includes song
    song.artist = self if song.artist == nil # set the artist attribute to self (current instance) if the artist attribute is empty
    song
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end

#
