require_relative './concerns/findable.rb'

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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    @@all << Artist.new(name)
    @@all.last
  end

  def add_song(song)
    @songs << song
    if song.artist.nil?
      song.artist = self
    end
    self.songs.uniq!
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end