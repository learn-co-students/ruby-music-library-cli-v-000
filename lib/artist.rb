class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.add_artist(self)
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
    artist = new(name)
    artist.save
    artist
  end
end
