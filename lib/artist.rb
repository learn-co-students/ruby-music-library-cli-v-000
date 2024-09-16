require_relative '../config/environment.rb'

class Artist
  extend Concerns::Findable
  extend Concerns::Basics
  include Concerns::FindableInstance
  attr_accessor :name, :songs, :genres

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
    song.artist == self ? self : song.artist = self
  end
  
  def genres
    genres = @songs.collect {|song| song.genre}
    genres.uniq
  end

end