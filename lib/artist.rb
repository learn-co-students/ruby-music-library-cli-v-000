require "pry"

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genre = []
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

  def self.create(artist_name)
    self.new(artist_name).tap {|artist| artist.save}
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if !song.artist
    # binding.pry
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end
