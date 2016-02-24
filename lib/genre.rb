require_relative '../concerns/findable'
require 'pry'
#extend Concerns::Findable
#extend Concerns::MaintainableClass
#include Concerns::MaintainableInstance

class Genre
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre # if I don't either return genre here, or don't return self in self.create, one test doesn't pass
  end

  def add_song(song_instance)
    if !songs.include?(song_instance) #we may need to check for the genre to be assigned instead of for the song instance itself
      @songs << song_instance
      song_instance.genre = self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def save
    self.class.all << self
    #self # if I don't either return self here, or return genre in self.create, one test doesn't pass. because otherwise returns entire array?
  end

end

