require 'pry'

class Artist
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
    self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    artist = self.new(name).save
    artist
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
    end
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def genres
    genre_list = []
    song_list = self.songs
    song_list.each do |song|
      if genre_list.include?(song.genre) == false
        genre_list << song.genre
      end
    end
    genre_list
    #binding.pry
  end
end
