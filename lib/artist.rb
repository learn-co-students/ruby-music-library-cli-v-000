require 'pry'

class Artist
  extend Concerns::Findable

  @@all = []
  attr_accessor :name
  attr_reader :songs

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

  def save
    @@all << self
  end

  def self.create(name)
     Artist.new(name).tap{|a| a.save}
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre }.uniq
  end
end
