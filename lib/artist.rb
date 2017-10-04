class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def self.create(name)
    Artist.new(name)
  end

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if songs.include?(song) == false
  end

  def genres
    array = self.songs.collect { |s| s.genre }
    array.uniq
  end



end
