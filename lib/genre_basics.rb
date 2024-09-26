require 'pry'
require_relative '../concerns/findable_module.rb'

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
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    @@all << genre
    genre
  end

  def add_song(song)
    if !song.genre
      @songs << song
      song.genre = self
    end
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end

end
