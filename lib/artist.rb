require_relative '../concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name 
  attr_accessor :songs

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

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)

    if self.songs.include?(song) == false
      @songs << song
    end

    if song.artist == nil
      song.artist = self
    end

  end

  def genres
    artists_genres = []

    @songs.each do |song|
      artists_genres << song.genre
    end

    artists_genres.uniq
  end




end