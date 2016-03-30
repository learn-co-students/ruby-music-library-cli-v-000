require 'pry'
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

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist.nil?
  end

  def genres
    gen = []
    @songs.each do |song|
      gen << song.genre
    end
    gen.uniq
  end
end