require 'pry'

class Genre
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

  def self.create(new_genre)
    if genre = all.detect {|genre| genre.name == new_genre}
      genre
    else
      genre = self.new(new_genre)
      genre
    end
  end

  def add_song(new_song)
    if new_song.genre != self
      new_song.genre = self
    end
    songs << new_song unless songs.include?(new_song)
  end

  def artists
    artists_uniq = []
    songs.each {|song| artists_uniq << song.artist unless artists_uniq.include?(song.artist)}
    artists_uniq
  end

end
