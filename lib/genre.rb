require 'pry'
# require_relative '../lib/concerns.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = [] #keeps track of all instance of genre that have been created.

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre_name)
    genre = Genre.new(genre_name)
    genre.save
    genre
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq

  end


end
