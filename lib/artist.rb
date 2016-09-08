class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    self
  end

  def songs=(song)
    @songs << song
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless self.songs.include?(song)
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
  end
end
