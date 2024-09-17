class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song if !self.songs.include?(song)
    song.artist = self if !song.artist
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

  def self.destroy_all
    self.all.clear
  end


end
