class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre, :songs
  attr_reader

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    songs.push song unless songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    songs.map(&:genre).uniq
  end

  def self.destroy_all
    @@all.clear
  end




  end
