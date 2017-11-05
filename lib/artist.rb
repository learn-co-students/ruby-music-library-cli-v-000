require_relative "concerns/findable.rb"

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.artist = self unless song.artist != nil
    end
  end

  def genres
    genres = []
    @songs.collect do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

  def songs
    @songs
  end
end
