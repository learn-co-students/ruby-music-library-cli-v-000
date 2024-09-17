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
    @@all << self
  end

  def self.create(artist)
    #binding.pry
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    #binding.pry
    @songs.collect do |song|
      song.genre
    end.uniq
  end
  
  def to_s
    self.name
  end

end