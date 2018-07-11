class Artist
  attr_accessor :name
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
    created_artist = Artist.new(name)
    @@all << created_artist
  end

  def add_song(name)
    song_instance = Song.new(name)
    song_instance.artist = self
    @songs << song_instance
  end

  def songs
    @songs
  end

end
