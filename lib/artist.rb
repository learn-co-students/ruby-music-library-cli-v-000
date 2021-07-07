require 'pry'


class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    Artist.new(name)
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end
end
