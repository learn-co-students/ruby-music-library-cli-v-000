require_relative '../concerns/findable.rb'
require 'pry'
class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs


  @@artists = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@artists
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@artists << self unless @@artists.detect { |artist| artist == self }
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs.detect { |name| self.songs << song if name != song }
  end

  def genres
    @songs.collect { |song| song.genre }.uniq
  end

end
