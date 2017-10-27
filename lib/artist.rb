class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
    # OR
    # new(name).tap { |a| a.save }
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end
end
