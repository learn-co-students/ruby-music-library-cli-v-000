class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song unless songs.include?(song)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_artist = self.new(name)
    created_artist.save
    created_artist
  end
end
