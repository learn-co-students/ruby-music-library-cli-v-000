class Artist

extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end

  def add_song(song)
    @songs.push(song) unless @songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end
end
