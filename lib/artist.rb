require 'pry'
class Artist
  @@all = []
  attr_accessor :name

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
    self.all.clear
  end

  def self.create(name)
    # self.new(name).tap {|s| s.save}
    artist = self.new(name)
    artist.save
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song unless self.songs.include? song
    # song.artist = self
    if song.artist
      song.artist
    else
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
end
