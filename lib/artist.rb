require_relative 'concerns/findable.rb'

class Artist
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    songs << song unless songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    songs.collect{|s| s.genre}.uniq
  end

end

