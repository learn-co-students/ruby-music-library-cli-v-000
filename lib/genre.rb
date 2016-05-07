require_relative '../concerns/findable'
require 'pry'

class Genre
  extend Concerns::Findable
  extend Concerns::MaintainableClass
  include Concerns::MaintainableInstance

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
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

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end

