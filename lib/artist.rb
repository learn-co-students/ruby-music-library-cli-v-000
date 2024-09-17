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
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    else
      self.songs.find(song)
    end
    song.artist = self if song.artist == nil
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
end
