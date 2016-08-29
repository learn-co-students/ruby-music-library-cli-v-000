require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = Artist.new(name)
    self.all << artist
    artist
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def self.all
    @@all
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

  def self.destroy_all
    all.clear
  end
end
