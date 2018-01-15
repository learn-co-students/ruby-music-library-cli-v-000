require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    #self is the Artist instance in this case
    if !song.artist #can I refactor using a ternary operator in some way
      song.artist = self
    end

    if !@songs.include?(song)
      @songs << song
    end

  end

  def genres  #can I refactor this using the tap method instead?
    genres = []
    @songs.each do |song|
      if !genres.include?(song.genre)
        genres << song.genre
      end
    end
    genres
  end
  # binding.pry

end
