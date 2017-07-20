class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def songs
    @songs
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
  end

end
