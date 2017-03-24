require 'pry'

class Artist
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self || !song.artist.nil?
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def self.destroy_all
    self.all.clear
  end

end
