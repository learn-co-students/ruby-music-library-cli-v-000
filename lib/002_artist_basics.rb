require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(new_artist)
    if artist = all.detect {|artist| artist.name == new_artist}
      artist
    else
      artist = self.new(new_artist)
      artist
    end
  end

  def add_song(new_song)
    if new_song.artist != self
      new_song.artist = self
    end
    songs << new_song unless songs.include?(new_song)
  end

  def genres
    genres_uniq = []
    songs.each {|song| genres_uniq << song.genre unless genres_uniq.include?(song.genre)}
    genres_uniq
  end

end
