class Artist

  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    if !songs.include?(song)
      songs << song
      song.artist = self unless song.artist
    end
  end

  def genres
    songs.map { |e| e.genre }.uniq
  end
end
