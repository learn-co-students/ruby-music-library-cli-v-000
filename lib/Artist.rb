require_relative './concerns/findable.rb'

class Artist
  attr_accessor :name

  extend Concerns::Findable

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
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist.nil? ? song.artist = self : ''
    self.songs.include?(song) ? '' : @songs << song
  end

  def genres
    list = self.songs.collect do |song|
      song.genre
    end
    list = list.uniq
  end
end
