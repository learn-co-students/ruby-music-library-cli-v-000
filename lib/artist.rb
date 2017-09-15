class Artist
  extend Concerns::Findable

  attr_accessor :name, :song, :genre

  @@all = []


  # Initialize #

  # Create instance, assign name, artist, genre
  # Add instance to Artists' songs array for self
  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    @songs = []
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

  # Print all unique genres that Artist instance is a subset of
  def genres
    @songs.map { |song| song.genre}.uniq
  end

  # Add song to artist's instance if not exists
  # Add song to artist's roster if not included
  def add_song(song)
    song.artist = self unless song.artist === self
    @songs << song unless @songs.include?(song)
  end


  # Class Methods #
  
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
  end


end
