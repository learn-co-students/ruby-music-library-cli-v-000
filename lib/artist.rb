require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
    if @genres.include? song.genre
      @genres[genre] << song
    else
      @genres << genre
      @genre[genre] << song
    end
  end

  def songs
    @songs
  end

end
