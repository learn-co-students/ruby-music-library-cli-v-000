require_relative './concerns/findable'

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
    artist.save
    artist
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

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.artist = self if song.artist.nil?
    end
  end

  def genres
    @songs.map {|song| song.genre}.uniq
  end

end
