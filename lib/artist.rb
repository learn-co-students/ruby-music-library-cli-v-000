require_relative "concerns.rb"

class Artist

  extend Concerns::Findable

  attr_reader :songs
  attr_accessor :name

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
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    @songs << song if !songs.include?(song)
    song.artist = self if song.artist.nil?
  end

  def genres
    genres = []
    songs.each do |song|
      genres << song.genre if !song.genre.nil? && !genres.include?(song.genre)
    end
    genres
  end

end
