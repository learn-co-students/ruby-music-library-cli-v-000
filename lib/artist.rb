class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song if songs.include?(song) == false
    song.artist = self if song.artist == nil
    song
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
    genres = genres.uniq
    genres
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
end
