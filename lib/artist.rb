require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if @songs.include?(song) == false
    song.artist = self if song.artist != self

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end
    .uniq
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

end
