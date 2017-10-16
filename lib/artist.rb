require 'pry'

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
    self.all.clear
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist ||= self
    songs << song unless self.songs.include?(song)

    # First attempt:
    # self.songs.include?(song) ? return : self.songs << song
  end

  def genres
    self.songs.collect { |song| song.genre}.uniq
  end

end
