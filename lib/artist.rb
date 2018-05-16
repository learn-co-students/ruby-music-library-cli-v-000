require 'rspec'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genres
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
    artist = self.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include?(song)
  end

    def genres
      self.songs.collect {|song| song.genre}.uniq
    end

    def self.songs
      @songs
    end
end
