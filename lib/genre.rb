require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []


  def initialize(name)
    @name = name
    @songs = []

  end

  def save
    @@all << self

  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end


#for each genre give me a list of uniqe aritst through the song
  def artists
    artists_in_genre = songs.collect { |a_song| a_song.artist }
    artists_in_genre.uniq
  end


end
