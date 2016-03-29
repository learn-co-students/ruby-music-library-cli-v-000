require 'pry'
class Artist

  extend Concerns::Findable
  attr_writer :name
  attr_reader :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
    #@genres = []
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
    artist = new(name)
  end

  def add_song(song)
    if !@songs.include?(song)
      self.songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    genres = []
  @songs.collect {|song| genres << song.genre }
    genres.uniq
  end
#binding.pry

end
