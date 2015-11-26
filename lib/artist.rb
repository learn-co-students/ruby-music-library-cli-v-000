require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  
  end

  def self.all
    @@all 
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
     Artist.new(name)
  end

  def add_song(song)
     self.songs << song unless songs.include?(song)
     song.artist = self if song.artist.nil?
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end



end
