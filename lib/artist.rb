class Artist
  attr_accessor :name
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
    @artist = artist
    @genre = genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def songs #not tested yet
    @songs
  end

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !@songs.include? (song)
      @songs << song
    end

  end

  def genres
    self.songs.collect do |song|
      song.genre
    end
    #@genres.uniq
  end






end
