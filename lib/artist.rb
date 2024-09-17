require 'pry'
require_relative '../concerns/findable.rb'
require_relative '../concerns/nameable.rb'
require_relative '../concerns/persistable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name 
    @songs = []
    # @@artists << self
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
    @@all << artist
    artist
  end

  def add_song(sng)
    if(sng.artist == nil)
      sng.artist = self
    end
    if(!@songs.include?(sng))
      @songs << sng
    end
  end

  def genres
    gen = []
    @songs.each do |song|
      if !gen.include?(song.genre)
        gen << song.genre
      end
    end
    gen
  end
end