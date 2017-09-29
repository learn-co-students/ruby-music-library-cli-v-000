require 'pry'
require_relative '../config/environment.rb'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def artists
    artists = self.songs.collect do |song|
      song.artist
    end
    artists.uniq
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
    genre = self.new(name)
  end

  def self.print_names
    @@all.each do |genre|
      puts genre.name
    end
  end

end
