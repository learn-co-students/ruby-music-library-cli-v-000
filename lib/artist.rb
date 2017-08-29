require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

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

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def save
    @@all << self
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if self.songs.none? {|s| s == song}
      self.songs << song
    end
  end

  def genres
    genres_array = self.songs.collect {|song| song.genre}
    genres_array.uniq
  end


end
