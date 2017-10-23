class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :song
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    self.songs.collect {|song|
      song.genre}.uniq
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if @songs.include?(song) == false
    song.artist = self if song.artist == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

end
