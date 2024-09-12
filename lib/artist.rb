  require 'pry'
  #require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.artist != self
      song.artist = self #unless song.artist == self
    end
    @songs << song unless @songs.include?(song)
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
    song = self.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    gs = []
    @songs.each do |song|
      gs << song.genre
    end
    gs.uniq
  end

#  def self.create_by_name(name)
#    artist = self.new(name)
#    artist.name = name
#    @@all << artist
#    artist
#  end

  def self.find_by_name(name)
    self.all.detect{|artist| artist.name == name}
  end

#  def self.find_or_create_by_name(name)
#    if self.find_by_name(name).nil?
#      self.create_by_name(name)
#    else
#      self.find_by_name(name)
#    end
#  end

#  def print_songs
#    @songs.each do |song|
#      puts song.name
#    end
#  end
end
