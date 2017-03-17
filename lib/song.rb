require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def artist=(artist)
    @artist = artist
    # artist.song << self
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre #same as in artist 'add_song'
    #song.genre << self unless song.genre.include?(self)
    genre.songs << self unless genre.songs.include?(self)

  end
end



# Song.new('mimis')   #creates an instance and calls initialize  used to play with the code
