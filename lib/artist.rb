class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    songs.map(&:genre).uniq
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
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs.push song unless songs.include?(song)
  end

end
