require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist_name)
    song = Artist.new(artist_name)
    song.save
    song
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include?(song)
  end


end
