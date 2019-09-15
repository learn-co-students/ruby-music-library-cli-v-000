# require_relative './song.rb'

class Artist
  extend Concerns::Findable

  @@all = []

  @songs = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include? song
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

end
