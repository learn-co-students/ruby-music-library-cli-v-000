class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    # song.artist == nil ? song.artist = self : nil
    song.artist = self unless song.artist == self
    # self.songs.include?(song) || self.songs << song
    # above wouldn't pass tests
    self.songs << song unless self.songs.include?(song)
  end
end
