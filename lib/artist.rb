require 'pry'
require_relative '../lib/concerns/findable'

class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(new_song)
    if new_song.is_a? Song
      if !@songs.include?(new_song)
        @songs << new_song
        if new_song.artist == nil
          new_song.artist = self
        end
      end
    end
  end

  def save
    @@all<<self
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end
end
