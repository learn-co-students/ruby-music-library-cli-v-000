require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    @name=name
    @songs =[]
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    self.songs << song unless (self.songs.include?(song))
    song.artist=self if song.artist != self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end
end