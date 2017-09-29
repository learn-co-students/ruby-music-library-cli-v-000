require 'pry'
require_relative '../config/environment.rb'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    self.songs << song unless songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name)
  end

  def self.print_names
    @@all.each do |artist|
      puts artist.name
    end
  end

end
