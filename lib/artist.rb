require_relative '../concerns/findable.rb'

require 'pry'
class Artist < Basics
  extend Concerns::Findable
  attr_accessor :name, :songs

 @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
     song.artist = self unless
      song.artist == self
      self.songs << song unless songs.include?(song)
  end

  def self.create(name)
    new(name).tap{|artist| artist.save}
  end

  def genres
    self.songs.map { |song| song.genre}.uniq
  end
end
