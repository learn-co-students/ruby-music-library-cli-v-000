require 'pry'

class Song

  @@all = [ ]

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist == nil ? @artist = artist : self.artist = artist #wouldn't have gottent his unless instructions indicated don't run #artist= if there is no artist argument
    genre == nil ? @genre = genre : self.genre = genre
  end

  def self.all #had to fix - forgot self
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self #had to fix -- forgot self.class
  end

  def self.create(name) #had to fix - the problem was it wanted me to return the created instance.
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    #self.artist = arty # IS THIS THE DANG PROBLEM??  THIS SAYS STACK LEVEL TOO DEEP -- this is where the loop is happening??
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

end
