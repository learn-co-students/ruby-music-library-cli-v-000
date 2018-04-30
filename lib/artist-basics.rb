require "byebug"
require_relative "../config/environment.rb"

class Artist
  extend Concerns::Findable
  include Concerns::Stringable

  @@all = []

  attr_accessor :name

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
   self.class.all << self
  end

  def add_song(song)
    @songs << song unless songs.include?(song)
    if song.artist == nil
      song.artist = self
    end
  end

  def songs
    @songs
  end

  def genres
    songs.map do |song|
      song.genre
    end
    .uniq
  end


end
