require "pry"
require_relative "../config/environment.rb"

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
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
