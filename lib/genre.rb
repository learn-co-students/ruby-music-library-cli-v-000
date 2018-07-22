require 'pry'

class Genre
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    #binding.pry
    self.new(name).save[0]
  end

  def artists
    artist_list = []
    song_list = self.songs
    song_list.each do |song|
      if artist_list.include?(song.artist) == false
        artist_list << song.artist
      end
    end
    artist_list
  end
end
