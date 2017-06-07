require 'pry'
class Artist
  include Concerns::Findable
  attr_accessor :name, :songs, :genre
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

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|s| s.save}
    #binding.pry
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  # binding.pry
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
    #self.songs.collect do |song|
    #  song.genre
    #binding.pry
    #end.uniq
  end
end
