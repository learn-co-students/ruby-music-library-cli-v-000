require "pry"
class Genre
  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
    save
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

  def self.create(song)
    # binding.pry
    new_song = Genre.new(song)
    # save
    # new_song.name
  end

  def add_song(song)
    # new_song  = Song.new(song)
    if song.genre == nil
      song.genre = self
    end
    # new_song.name = song.name
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def artists
    @songs.map(&:artist).uniq
  end

  extend Concerns::Findable


end
