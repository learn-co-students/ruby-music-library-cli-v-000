require 'pry'

class Artist
  attr_accessor :name, :artist, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
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

  def self.create(name)
    self.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    #use an iterator
    songs.collect {|song| song.genre}.uniq
  end
#  binding.pry
end
