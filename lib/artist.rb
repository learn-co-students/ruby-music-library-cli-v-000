require_relative '../lib/concerns/findable.rb'
require 'pry'

class Artist

  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song) # song arg is the variable name of that Song class instance; it's a Song class object
    song.artist ||= self
    self.songs << song unless self.songs.include?(song)
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    genres = songs.collect do |song|
      song.genre
    end
    genres.uniq
  end


end

