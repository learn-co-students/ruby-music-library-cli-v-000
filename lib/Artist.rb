require 'pry'

class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

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
    song = self.new(name)
    song.save
    song
  end


  # def add_songs(songs)
  #   songs.each { |song| add_song(song) }
  # end


  # def add_song(song)
  #   @songs << song
  #   song.artist = self
  # end
  #
  # def songs
  #   @songs
  # end

  # def artists
  #   @songs.collect do |song|
  #     song.artist
  #   end
  # end

end
