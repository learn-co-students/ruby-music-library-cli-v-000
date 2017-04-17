require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song unless self.songs.include?(song)
  end

end
