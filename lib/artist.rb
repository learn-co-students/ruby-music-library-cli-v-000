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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    unless songs.include?(song)
      self.songs << song
      song.artist = self
    end
  end

  def genres
    songs.collect {|song| song.genre }.uniq
  end
end