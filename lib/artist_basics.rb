require 'pry'
require_relative '../concerns/findable_module.rb'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :song, :songs
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
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    if !song.artist
      @songs << song
      song.artist = self
    end
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

end
