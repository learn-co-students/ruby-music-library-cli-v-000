require "pry"
class Artist
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    genres = []
    @songs.each do |e|
      if !genres.include?(e.genre)
        genres << e.genre
      end
    end
    genres
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
  end

  def songs
    @songs
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
end
