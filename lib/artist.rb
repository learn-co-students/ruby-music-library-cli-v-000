class Artist
  attr_accessor :name, :song, :songs
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

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Artist.new(name).save
  end

  def add_song(song)
    self.song = song
    song.artist = self
    @songs << song
  end
end
