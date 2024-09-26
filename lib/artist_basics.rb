class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self if !self.class.all.include?(self)
  end

  def add_song(song)
    song.artist = self if !song.artist
    songs << song if !songs.include?(song)
  end

  def genres
    songs.collect {|song|
      song.genre
    }.uniq
  end

end
