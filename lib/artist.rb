class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
    song
  end

  def genres
    array = self.songs.collect {|song| song.genre}
    array.uniq
  end
end
