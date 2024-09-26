require_relative '../concerns/findable.rb'

class Artist
  attr_accessor :name, :songs
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
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

end
