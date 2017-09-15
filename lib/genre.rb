class Genre
  extend Concerns::Findable

  attr_accessor :name, :artist, :song

  @@all = []

 # Initialize #

 # Create instance, add songs to genre list
  def initialize(name, artist=nil)
    @name = name
    @songs = []
    @artist = artist
    @@all << self
  end


  # Instance Methods #

  def save
    @@all << self
    self
  end

  def songs
    @songs
  end

  # Return all artists in songs array that are unique
  def artists
    @songs.map {|song| song.artist}.uniq
  end

  def add_song(song)
    @songs << song
  end


  # Class Methods #

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
  end


end
