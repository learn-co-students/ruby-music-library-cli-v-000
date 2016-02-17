require "pry"
require_relative "../concerns/findable.rb"

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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
    song.artist ||= self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = @songs.collect { |song| song.genre }
    genres.uniq
  end


end