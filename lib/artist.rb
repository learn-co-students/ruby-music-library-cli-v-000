class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    self.songs.collect { |s| s.genre }.uniq
  end

  def add_song(song)
    song.artist = self if song.artist != self
    self.songs << song unless @songs.include?(song)
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
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

end
