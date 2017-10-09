require 'pry'

class Song

  extend Concerns::Findable

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

  def self.new_from_filename(filename)
    song_title = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].chomp(".mp3")
    s = self.find_or_create_by_name(song_title)
    s.artist = Artist.find_or_create_by_name(artist_name)
    s.genre = Genre.find_or_create_by_name(genre_name)
    s
  end

  def self.create_from_filename(filename)
    s = new_from_filename(filename)
    # s.save - this resulted in double saving
  end

end
