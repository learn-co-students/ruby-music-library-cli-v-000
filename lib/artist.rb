class Artist
  extend Concerns::Findable

  attr_accessor :name, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = [] #artist has many songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs #returns artist's songs collection
    @songs
  end

  def add_song(song)
    if song.artist == nil #if song instance has no artist
      song.artist = self  #assign the current instance of artist to the song's artist
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    songs.collect {|song| song.genre}.uniq # loop through the artist's songs array
      #song.genre #pick out a song's genre
  end
end
