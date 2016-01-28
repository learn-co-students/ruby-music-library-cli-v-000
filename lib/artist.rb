require_relative '../lib/concerns/findable.rb'

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
  end

  def self.create(name)
    Artist.new(name).save
    Artist.all.last
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist ||= self
    song.artist.name = @name
  end

  def genres
    @songs.map{|song| song.genre}.uniq
  end

end

