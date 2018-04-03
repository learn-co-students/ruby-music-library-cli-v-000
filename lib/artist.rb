class Artist
  attr_accessor :name, :artist, :genres
  @@all = []

  #constructors

  def initialize(name)
    @name = name
    @songs = []
  end

  #Class Methods

  def self.all
    @@all
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def self.destroy_all
    all.clear
  end

  #Instance Methods

  def songs
    @songs
  end

  def add_song(song)
      @songs << song if !@songs.include?(song)
      song.artist = self if !song.artist
    end

  def save
    @@all << self
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end
