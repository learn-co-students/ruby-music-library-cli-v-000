require 'pry'

class Artist

  attr_accessor :name
  attr_reader :songs
  @@all = []
  extend Concerns::Findable


  def initialize (name)
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
    self.class.all << self
  end

  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    unless song.artist
      song.artist = self
    end
    unless self.songs.include? (song)
      @songs << song
    end
  end

  def genres
    artist_songs = self.songs
    artist_songs.collect {|song| song.genre}.uniq
  end

end
