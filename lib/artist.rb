require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name, songs = nil)
    @name = name
    (!songs) ? @songs = Array.new : @songs = songs
  end

  def genres
    genres = [];
    @songs.each do |song|
      !genres.include?(song.genre) ? genres << song.genre : nil
    end
    genres
  end
  def name=(new_name)
    @name = new_name
  end

  def add_song(song)
    if !song.artist && !@songs.include?(song)
      @songs << song
      song.artist = self
    end
  end

  def save
     @@all << self
    end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = Array.new
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

end
