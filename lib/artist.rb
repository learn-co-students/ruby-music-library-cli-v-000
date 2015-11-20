require 'pry'

class Artist
  attr_accessor :name, :genre, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name_string)
    @name = name_string
    @@all << self
    @songs = []
  end

  def add_song(inst)
    inst.artist = self if inst.artist.nil?
    self.songs << inst if !@songs.include?(inst)
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

  def self.create(nm)
    new_artist = Artist.new(nm)
  end

  def genres
    @songs.collect{|s| s.genre}.uniq
  end
end