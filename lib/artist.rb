require_relative '../config/environment.rb'

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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist)
    artist = Artist.new(artist)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end
end
