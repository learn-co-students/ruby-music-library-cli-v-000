require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song) == true
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end

end
