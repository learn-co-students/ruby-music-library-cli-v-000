require_relative '../lib/concerns/findable.rb'

# lib/artist.rb
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    Artist.new(name).save
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist ||= self
  end

  def genres
    @songs.map(&:genre).uniq
  end
end
