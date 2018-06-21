class Artist
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if !song.artist
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end
end
