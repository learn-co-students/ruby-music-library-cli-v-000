require_relative '../lib/concerns/findable.rb'

class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|x| x.save}
  end

  def self.all
    @@all
end

def artists
    self.songs.collect{|songs| songs.artist}.uniq
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    end
    if !song.genre
      song.genre = self
    end
  end
end
