require 'pry'
require_relative './concerns/findable'


class Artist
  attr_accessor :name
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name=name
    @songs=[]

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if self.songs.include? (song)
    else
    @songs<<song
    end

    artist_check = song.artist
    if artist_check ==nil
    song.artist = self
    end

  end

  def genres
    new_array = self.songs.map {|song| song.genre}
    new_array.uniq
  end



end
