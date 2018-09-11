require_relative './concerns/concerns.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_name)
    song_name.artist = self unless song_name.artist
    songs << song_name unless songs.include?(song_name)
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

  # def self.create(artist_name)
  #   artist = Artist.new(artist_name)
  #   artist.save
  #   artist
  # end

  def genres
    songs.collect { |song| song.genre }.uniq
  end
end
