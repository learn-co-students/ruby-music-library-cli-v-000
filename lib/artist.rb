class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
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
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def songs
    @songs
  end

  def add_song(song) #this method takes a song instance,and adds it to the artist's collection
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song) #adds the song to the artist's collection
  end
end
