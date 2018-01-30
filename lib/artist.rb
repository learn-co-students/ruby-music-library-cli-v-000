require_relative 'concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !(self.songs.include?(song))
      self.songs << song
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

end
