require 'pry'


class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def genres
    artist_songs = @@all.collect do |artist|
      artist.songs
    end
    genre_of_songs = artist_songs.flatten.collect do |songs|
      songs.genre
    end
    genre_of_songs.uniq
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
    self.new(name)
  end

  def add_song(new_song)
      if !@songs.include?(new_song)
      @songs << new_song
      end
      if new_song.artist == nil
        new_song.artist = self
      end
  end
end
