require_relative '../config/environment.rb'

class Genre
  extend Concerns::Findable
  extend Concerns::Basics
  include Concerns::FindableInstance
  attr_accessor :name, :artists, :songs

  @@all = []

  def initialize(name)
    @name = name 
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs.include?(song) ? song : @songs << song
    song.genre == self ? self : song.genre = self
  end

  def artists
    artists = @songs.collect {|song| song.artist}
    artists.uniq
  end
end