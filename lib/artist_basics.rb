require 'pry'
require_relative '../concerns/findable.rb'

class Artist
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

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist_name)
    new_artist = self.new(artist_name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    songs.map { |h| h.genre }.uniq 
  end
end








