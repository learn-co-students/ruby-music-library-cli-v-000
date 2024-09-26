
require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []
  @songs = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
    # songs << self

  end

  def genres
    songs.collect.each {|song| song.genre}.uniq
    # returns a collection of genres for all of the artist's songs
  end


    def songs
      @songs
    end

end
